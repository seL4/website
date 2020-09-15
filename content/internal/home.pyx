#
# Copyright 2020  seL4 Project a Series of LF Projects, LLC.
# SPDX-License-Identifier: GPL-2.0-only
#

import string
import os
import time
import subprocess
from mod_python import apache, util
from ertos import *
from ertos_config import cfg

# We assume people who can get to this point are more-or-less trusted; there's
# no real attempt to make this code secure.

process_env = {
    'HOME' : '/var/www',
    'PATH' : '/bin:/usr/bin:/usr/local/bin'
}


def get_title(req):
    return "git commit"

def do_pull(req, path):
    # Rate limit
    if 'branch' in query and query['branch'][0] != 'master':
        req.write("Will not update non-master branch")
        return apache.OK

    now = time.time()
    try:
        last = os.stat("/tmp/last_pull_time").st_mtime
    except:
        last = 0.0
    if now < last + 15 * 60:
        req.write("Too Soon after last update %d < %d" % (now, last))
        return apache.OK
    f = open("/tmp/last_pull_time", "w")
    f.write(time.ctime(now))
    f.close()

    x = subprocess.run("cd %s; /usr/bin/git pull --ff-only" % path,
                       shell=True, env=process_env,
                       capture_output=True, encoding='utf-8')
    if 'quiet' not in query:
        req.write('<pre>%s %s</pre>' % (x.stdout, x.stderr))
    return apache.OK


def handler(req, query, path=""):
    cfg.read(req.get_options()['site_config'])
    # Path to website content root
    DirRoot = cfg.get('core', 'base_dir') + "/"
    DirRoot = os.path.normpath(DIRROOT) + "/"


    # 002 - so that files created with www-data can be changed by
    # people in the group
    old_umask = os.umask(0o02)

    http_status_code = apache.OK

    req.content_type = "text/html"
    req.send_http_header()
    if "operation" in query:
        if query["operation"][0] == "Update":
            http_status_code = do_pull(req, DirRoot)
        else:
            req.write("Don't know about that!\n")
            http_status_code = apache.OK
    else:
        util.redirect(req, location="/", permanent=False)

    os.umask(old_umask)           # restoring umask
    return http_status_code
