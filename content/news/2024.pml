<!--<title>News about seL4 and the seL4 Foundation</title>-->
<!--
    Copyright 2024 seL4 Project a Series of LF Projects, LLC.
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
<div class="news-item tag-link" id="brief-unique-anchor-name">
  <a href="#brief-unique-anchor-name"><span class="tag-span"># </span></a> 29 Jan 2021: Raytheon joins the seL4 Foundation
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
<div class="news-item tag-link" id="summit-2024-location">
  <a href="#summit-2024-location"><span class="tag-span"># </span></a>
  9 February 2024: The seL4 summit 2024 will be held in Sydney, Australia
</div>
<div>
    <a href = "../Foundation/Summit/2024">
    <img src="/images/summit/sel4_summit_2024.svg"
    style="width: 15%; float:right"
    alt="seL4 summit" />
    </a>
    <p>
      It is our pleasure to confirm that the <a href="../Foundation/Summit/2024">seL4 Summit 2024</a> will be in:
    </p>
    <p class="highlight">
      Sydney, Australia, Oct 2024 (dates TBC).
    </p>
    <p>
      We look forward to welcoming the community in the birthplace of seL4.
    </p>
    <p>
      We will announce a Call for Presentations in the coming weeks. Stay tuned!
    </p>
    <div style="margin: auto; width: 100%;text-align:center">
      <img src="/images/summit/sydney-harbour.jpg" alt="Sydney Harbour" />
    </div>
</div>


<!----------------------------------------------------------->
<div class="news-item tag-link" id="lf-annual-report">
  <a href="#lf-annual-report"><span class="tag-span"># </span></a>
  29 January 2024: seL4 features in the Linux Foundation’s 2023 Annual report
</div>
<div style="margin: auto; width: 100%;text-align:center">
    <a href = "https://www.linuxfoundation.org/hubfs/Reports/2023_lf_annual_report_122123a.pdf?hsLang=en">
    <img src="/images/lf-annual-report-2023.png"
    style="width: 70%;"
    alt="LF annual report" />
    </a>
</div>
<div class="news-finish">
</div>
