<!--<title>Summit abstracts</title>-->
<!--
    Copyright 2022 seL4 Project a Series of LF Projects, LLC.
    SPDX-License-Identifier: CC-BY-SA-4.0
-->

<h1>Summit</h1>

<%
from os import listdir
from os.path import isfile, join
from ertos_config import cfg
import re
cfg.read('config.cfg')
newsdir = cfg.get('core', 'content_dir') + '/news/'
files =  sorted([f for f in listdir(newsdir) if re.match(r'^20[0-9][0-9]\.pml$', f)])
reflist = []
reflist2 = []
for x in files:
    link = '/news/' + x[:4]
    reflist.append('<a href="%s">%s</a>' % (link, x[:4]))
    reflist2.append(x)
reflist = ' '.join(reflist)
%>
Older News: <%=reflist2%>
 </div>


</div>


