# Copyright 2019 CSIRO
# Copyright 2020 seL4 Project a Series of LF Projects, LLC.
#
# SPDX-License-Identifier: GPL-2.0-only

"""
So that you can do "from config import cfg" and get an singleton of the config
instance.

### The configuration files should be in ../configs/ to this file. ###

Note that you will need to populate the object by calling cfg.read(confile).

Modified from the Mothra bug tracker:
http://wiki.nyloncactus.com/mothra:start

"""

from configparser import ConfigParser
import os


class Config(ConfigParser):
    def __init__(self, basepath):
        """ Load all our config files. """
        ConfigParser.__init__(self)

        self.basepath = basepath+"/../configs/"
        self.loaded = False

    def read(self, confile):
        if os.path.exists(confile):
            ConfigParser.read(self, confile)
        else:
            ConfigParser.read(self, self.basepath+confile)
        self.loaded = True

    def getlist(self, section, var):
        return self.get(section, var).split('\n')


cfg = Config(os.path.dirname(os.path.abspath(__file__)))

if __name__ == '__main__':
    cfg.read('config.cfg')
    print(cfg.get('core', 'rg_abbrev'))
    print(cfg.getlist('git', 'upstreams'))
