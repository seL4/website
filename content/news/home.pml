---
---
<%
#    Copyright 2021 seL4 Project a Series of LF Projects, LLC.
#    SPDX-License-Identifier: CC-BY-SA-4.0
#
# this has to happen before any content that
# might otherwise be sent to the client.
# Find the latest file in ./news/ and redirect to that.
from os import listdir
from os.path import isfile, join
import re
from ertos_config import cfg
cfg.read('config.cfg')
newsdir = cfg.get('core', 'content_dir') + '/news/'
files = [f for f in listdir(newsdir) if re.match(r'^20[0-9][0-9]\.pml$', f)]
latest = sorted(files, reverse=True)[0]
psp.redirect('/news/' + latest[:4])
%>
<!--<title>News about seL4 and the seL4 Foundation</title>-->
