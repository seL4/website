<!--<title>News about seL4 and the seL4 Foundation</title>-->
<!--
    Copyright 2023 seL4 Project a Series of LF Projects, LLC.
    SPDX-License-Identifier: CC-BY-SA-4.0
-->
<div class="row">
 <div class="col">
  <h1>
    News about
    <a href="/">seL4</a>
    and the
    <a href="/Foundation">seL4 Foundation</a>
  </h1>
 </div>
 <div class="col">
<%
from os import listdir
from os.path import isfile, join
from ertos_config import cfg
import re
cfg.read('config.cfg')
newsdir = cfg.get('core', 'content_dir') + '/news/'
files =  sorted([f for f in listdir(newsdir) if re.match(r'^20[0-9][0-9]\.pml$', f)])
reflist = []
for x in files:
    link = '/news/' + x[:4]
    reflist.append('<a href="%s">%s</a>' % (link, x[:4]))
reflist = ' '.join(reflist)
%>
Older News: <%=reflist%>
 </div>
</div>

<!--
<div class="news-item" id="brief-unique-anchor-name">
  29 Jan 2021: Raytheon joins the seL4 Foundation
</div>
<div>
 <p>

   <a href="https://www.rtx.com/">
     <img src="/Foundation/Membership/LOGOS/raytheontechnologies.svg"
	  style="width: 20%;  padding-left:10px;  float:right"
	  alt="Raytheon logo"/>
   </a>

    blah blah blah blah blah blah blah blah blah blah blah blah blah
    blah blah blah blah blah blah blah blah blah blah blah blah blah
    blah blah blah blah blah blah blah blah blah blah blah blah blah
    blah blah blah blah blah blah blah blah blah blah blah blah blah
    blah blah blah blah blah blah blah blah blah blah blah blah blah
    blah blah blah blah blah blah blah
 </p>
</div>
-->

<!----------------------------------------------------------->
<div class="news-item" id="summit-2023-minneapolis">
    8 February 2023: the seL4 summit 2023 will be held in Minneapolis, USA
</div>
<div>
    <a href = "../Foundation/Summit">
    <img src="/images/sel4-summit-logo.svg"
    style="width: 30%; float:right"
    alt="seL4 summit" />
    </a>
    <p>
      It is our pleasure to confirm that the <a href="../Foundation/Summit/">seL4 Summit 2023</a> will be in:</p>
      <div class="highlight">Minneapolis, USA, Sept/Oct 2023 (dates TBC).</div>
    <p>
      <video width="320" height="240" controls>
        <source src="../Foundation/Summit/summit23-location.m4v" type="video/mp4">
        Your browser does not support the video tag.
      </video>
  <p>
    The summit will be hosted by the <a href="https://www.linuxfoundation.org/">Linux Foundation</a>, and will be an in-person event.
  </p>
  <p>
    It will focus on four core areas:
  </p>
  <ul>
    <li>seL4 work</li>
    <li>seL4 experience</li>
    <li>seL4 thoughts</li>
    <li>seL4 questions</li>
  </ul>
  <p>
    We will announce a Call for Presentation in the coming weeks. Stay tuned!
  </p>
</div>

</div>
<div class="news-finish">
</div>
