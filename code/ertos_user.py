# Copyright 2019 CSIRO
# Copyright 2020 seL4 Project a Series of LF Projects, LLC.
# SPDX-License-Identifier: GPL-2.0-only
#
import sys, os
import ldap
from ertos_config import cfg
import time
# TODO: replace this with oauth lookups to github

cfg.read("config.cfg")

global ldapcon
ldapcon = None
global basedn
basedn = ''

class User:
    """ The User class maps logged in userids to names and email addresses"""

    class LDAPException(Exception):
        def __init__(self, value):
            self.error = str(value)

        def __str__(self):
            return self.error

    def __init__(self, login):
        global ldapcon
        global basedn
        if basedn == '':
            basedn = cfg.get('ldap', 'basedn')

        if ldapcon is None:
            ldapuri = cfg.get('ldap', 'uri')
            try:
                ldapcon = self.ldap_obj = LDAP(ldapuri)
            except Exception as e:
                raise Exception('Failed to bind to Ldap: %s' % e)

        try:
            self._data = []
            search = 'uid=%s' % str(login).strip()
            self._data = ldapcon.search_s(basedn, ldap.SCOPE_SUBTREE, search)
        except Exception as e:
            raise self.LDAPException("Got error in search: '%s' '%s'<br/>%s" %
                                     (basedn, search, e))
        if not self._data:
            raise self.LDAPException("%s not known" % login)

        self.index = 0
        self.iterator = False
        self.unique =  len(self._data) == 1

    def result(self):
        return self.data

    def __iter__(self):
        return self
    def __next__(self):
        if self.index == len(self._data)-1:
            raise StopIteration
        if not self.iterator and self.index == 0:
            # If we just started iterating, return the first element
            self.iterator = True
            return self
        else:
            # Return the next element
            self.index = self.index + 1
            return self

    def get(self, key):
        if key in self._data[self.index][1]:
            return self._data[self.index][1][key][0]
        return ''

    def get_dict(self):
        if self.unique:
            return self._data[0][1]
        return self._data[self.index][1]

    def keys(self):
        if self.unique:
            return list(self.get_dict().keys())

    def email(self):
        if self.unique:
            return self._data[0][1]['mail'][0].decode('utf-8')

    def fullname(self):
        if self.unique:
            return self._data[0][1]['displayName'][0].decode('utf-8')

    def __str__(self):
        d = []
        for k in list(self.keys()):
            d.append('%s: %s' % (k, self.get(k)))
        return 'LDAP(' + ', '.join(d) + ')'

class LDAP(object):
    """
    Wrapper for ldap.ldapobject.ReconnectLDAPObject which:
    * uses only one LDAP connection
    * keeps a read-cache
    * has no write support

    TODO:
    * add write support?
    """
    _cache_minutes = 60*5
    _ldapobj__instance = None
    _ldap_cache = None
    _ldap_hitcount = None
    def __init__(self, ldap_uri, binddn='', bindpwd='', opt_referrals=0):

#if LDAP._ldapobj__instance is None:
        # singleton by putting the attribute as class attribute instead of
        # instance attribute
        LDAP._ldapobj__instance = ldap.ldapobject.ReconnectLDAPObject(ldap_uri)
        if binddn != '':
            LDAP._ldapobj__instance.simple_bind_s(binddn, bindpwd)
        LDAP._ldapobj__instance.set_option(ldap.OPT_REFERRALS,opt_referrals)

        # keep a reference to it
        self.__dict__['_ldapobj__instance'] = LDAP._ldapobj__instance

        # same goes for our cache
        if LDAP._ldap_cache is None:
            LDAP._ldap_cache = {}
        self.__dict__['_ldap_cache'] = LDAP._ldap_cache

        if LDAP._ldap_hitcount is None:
            LDAP._ldap_hitcount = {}
        self.__dict__['_ldap_hitcount'] = LDAP._ldap_hitcount

    def search_s(self, *args, **kws):
        '''search_s(base, scope, filterstr='(objectClass=*)', attrlist=None, attrsonly=0)'''
        search_str = args[2]

        try:
            result = None
            if search_str in list(self._ldap_cache.keys()):
                result = self._ldap_cache.get(search_str)
        except Exception as e:
            raise Exception("Error in the cache: %s<br/>%s"%(search_str,e))
        if result == None or time.time() > result[1] + self._cache_minutes*60:
            try:
                result = self._ldapobj__instance.search_s(*args, **kws)
            except Exception as e:
                raise Exception("Search error: %s"%(e))

            # cache it
            self._ldap_cache[search_str] = (result, time.time())
        else:
            result = result[0]
        # update hitcount
        hitcount = self._ldap_hitcount.get(search_str, 0) + 1
        self._ldap_hitcount[search_str] = hitcount
        return result

    def stats(self):
        stats = []
        stats.append('UUID of the LDAP singleton: %s.' % id(self._ldapobj__instance))
        stats.append('Entries in cache: %s.' % len(list(self._ldap_cache.keys())) )

        x = 0
        for i in list(self._ldap_hitcount.keys()):
            x += self._ldap_hitcount.get(i, 0)
        stats.append('Number of times the cache is used: %s.' % x)

        return stats
    
if __name__ == "__main__":
    cfg.read("config.cfg")
    foo = User(login='Foo')
    print(foo)
    print(foo.email())
    print(foo.fullname())
    exit()
