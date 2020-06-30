# Copyright 2019 CSIRO
# Copyright 2020 seL4 Project a Series of LF Projects, LLC.
#
# SPDX-License-Identifier: GPL-2.0-only

"""
Stuff to generate a list of links from a directory. This can be
customized with some special files in the directory:
 * .menu - stuff that gets added to the left navigation menu
 * .ignore - files/directories to be removed from the list
 * .order - re-order the url list
 * .names - alter the label for the directories (not implemented)

TODO

* .menu, .order and .names should be combined. I'm purposing a .nav
  with fields:
  * dir/file name
  * menu name
  * breadcrumb name
  * sort order (a arbitrary number with default 0, lower number appears
    first.

"""

import os
import operator


class NavEntry(object):
    def __init__(self, label='', uri="#", children=None, html_attr=None):
        self.label = label.strip()
        self.uri  = uri.strip()
        self.children = children
        self.html_attr = html_attr

    def toAnchorString(self):
        if self.html_attr:
            return '<a href="%s" %s>%s</a>' % (self.uri, self.html_attr, self.label)
        return '<a href="%s">%s</a>' % (self.uri, self.label)

    __str__ = toAnchorString

    def __repr__(self):
        return '(%s, %s, %s)' % (self.label, self.uri, self.children)
    
    def cmp(self, other):
        if self.label == other.label:
            if self.children == other.children:
                return 0
            if self.children > other.children:
                return 1
            return -1
        if self.label > other.label:
            return 1
        return -1

    def __lt__(self, other):
        return self.cmp(other) < 0


def dir2list(sitebase_dir, target=None, top_level=True):

    if target==None:
        target = sitebase_dir

    urls = []
    
    if sitebase_dir.endswith('/'):
        sitebase_dir = sitebase_dir[:-1]
    base_url = target[len(sitebase_dir):]

    ## .ignore
    ignore_list = ['CVS']
    ignore_fname = os.path.join(target,'.ignore')
    if os.path.exists(ignore_fname):
        ignorefile = open(ignore_fname, "r")
        for line in ignorefile.readlines():
            line = line.strip()
            if line.startswith('#') or line == '': continue
            ignore_list.append(line)
        ignorefile.close()

    ## .names
    menu_map = {}
    names_file = os.path.join(target, '.names')
    if os.path.exists(names_file):
        f = open(names_file, "r");
        for line in f.readlines():
            line = line.strip()
            if line.startswith('#') or line == '': continue
            try:
                fname,crumbname,menuname = line.split('|')
                menu_map[fname.strip()] = menuname.strip()
            except Exception as e:
                raise
                #continue       # ignore 
        f.close()

    ## insert .menu here.
    dotmenu = os.path.join(target,'.menu')
    if os.path.exists(dotmenu):
        f = open(dotmenu, "r");
        for line in f.readlines():
            line = line.strip()
            if line.startswith('#') or line == '': continue
            x = line.split('|')
            if len(x) == 2:
##                label = menu_map.get(x[0], x[0].title())
                label = x[0]           # honor capitalization in .menu files
                y = x[1].strip()
                if not y.startswith('http'):
                    uri = os.path.join(target[len(sitebase_dir):],y)
                else:
                    uri = y
                urls.append(NavEntry(label=label, uri=uri))
        f.close()
##        return urls # ignoring sub-directories, .order and .baselinks

    ## adding sub-directories 
    children = os.listdir(target)            
    for x in children:
        if x in ignore_list:  continue

        fname = os.path.join(target,x)
        if os.path.isdir(fname):
            y = dir2list(sitebase_dir, fname, top_level=False)
            u = fname[len(sitebase_dir):]
            if not u.startswith('/'):
                u = os.path.join('/', u)
            if not u.endswith('/'):
                u = u + '/'
            label = menu_map.get(x, x.title())
            if not u.startswith('http'):
                u = os.path.join(target[len(sitebase_dir):],u)
            url = NavEntry(label=label, uri=u, children=y)
            if url not in urls:
                urls.append(url)

    ## sort the urls alphabetically
    urls.sort()
    
    ## reorder the entries according to .order if exists
    order_file = os.path.join(target, '.order')
    if os.path.exists(order_file):
        f = open(order_file, "r");
        urls_sort = []
        lines = f.readlines()
        lines_new = []
        for line in lines:
            x = line.strip()
            x = x.lower()			# case-insensitive
            if x.startswith('#') or x == '': continue
            lines_new.append(x)
        lines = lines_new
        f.close()

        for url in urls:
            i = 9999     # so that unspecified entries stays at the end.
            if url.label.lower().strip() in lines: # case-insensitive match
                i = lines.index(url.label.lower())    
            urls_sort.append((url,i))
        urls_sort.sort(key=operator.itemgetter(1))
        urls = list(map(operator.itemgetter(0),urls_sort))

    ## insert /.baselinks at top level
    baselinks_file = os.path.join(sitebase_dir, '.baselinks')
    if top_level and os.path.isfile(baselinks_file):
        urls.insert(0, NavEntry())     # an empty one - normally will be displayed as  a <hr/> 
        f = open(baselinks_file, "r")
        lines = f.readlines()
        lines.reverse()
        for line in lines:
            line = line.strip()
            if line == '' or line.startswith('#'): continue
            label = uri = ''
            try:
                label, uri = line.split('|')
                label = label.strip()
                uri = uri.strip()
            except:
                continue
            u = NavEntry(label=label,uri=uri)
            urls.insert(0,u)
        f.close()

    ## Give alterate names from .names
    if len(urls) > 0:
        return urls
    return None
        


if __name__ == '__main__':
    import sys
    l = dir2list(sys.argv[1])
    for i in l:
        print(i)


# vim: set expandtab:
