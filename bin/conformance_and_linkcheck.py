#!/usr/bin/python3
#
# Copyright 2020 seL4 Project a Series of LF Projects, LLC.
# Copyright 2019 CSIRO
# SPDX-License-Identifier: GPL-2.0-only
#
# Run a link checker over the live website.
# Send email on error
#

from ertos_config import cfg
import smtplib
import os
from email.mime.text import MIMEText
from subprocess import run
import sys
sys.path.append(os.path.join(os.path.dirname(os.path.abspath(__file__)), "../code"))
cfg.read('config.cfg')

mailhost = cfg.get('hosts', 'mailhost')
RECIPIENTS = ['webmaster@%s' % cfg.get('hosts', 'maildomain')]
CONTENTROOT = cfg.get('core', 'content_dir')
OUTPUTDIR = '%s/linklint' % CONTENTROOT
URL = "https://%s/" % cfg.get('hosts', 'live')
URL1 = "https://docs.%s/" % cfg.get('hosts', 'live')

linklint = run(
    [
        '/usr/bin/linkchecker',
        '-F',
        'html/%s/index.html' % OUTPUTDIR,
        '--no-status',
        '--ignore-url="print$"'
        '--ignore-url="/blob/"'
        '--check-extern',
        URL, URL1
    ],
    encoding='utf-8',
    capture_output=True)

output = """
Linkcheck output
================
"""

output += linklint.stdout + linklint.stderr

if 'Error' in linklint.stderr or 'Warning' in linklint.stderr:
    s = smtplib.SMTP()
    s.connect(mailhost)
    message_head = """Linklint summary.
Visit %s/linklint/index.html for full report.

""" % cfg.get('hosts', 'url')
    message = message_head + output
    msg = MIMEText(message, _charset='utf-8')
    msg['Subject'] = 'Website Link Report (broken links were found)'
    msg['From'] = 'webmaster@%s' % cfg.get('hosts', 'maildomain')
    for recipient in RECIPIENTS:
        msg['To'] = recipient
        s.sendmail('webmaster@%s' % cfg.get('hosts', 'maildomain'), [recipient], msg.as_string())
