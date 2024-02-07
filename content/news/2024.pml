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
<div class="news-item tag-link" id="summit-2024-pc">
  <a href="#summit-2024-pc"><span class="tag-span"># </span></a>
  14 February 2024: Meet the Program Committee of the seL4 summit 2024
</div>
<div>
    <a href = "../Foundation/Summit/2024">
    <img src="/images/summit/sel4_summit_2024.svg"
    style="width: 15%; float:right"
    alt="seL4 summit" />
    </a>
    <p>
      We are thrilled to announce our program committee for the <a href="../Foundation/Summit/2024">seL4 Summit 2024</a>.
      Our awesome team comes from various parts of the seL4 ecosystem: users, contributors, committers, experts, advocates, researchers, and engineers.
    </p>
    <div class="people_grid">
  <div class="person">
    <div class="person_pic">
      <a href="http://www.ikuz.org"><img src="../../../images/tsc/ihor.jpg" alt="Ihor Kuz" width="80" /></a>
    </div>
    <div class="person_title">
      <strong><a href="http://www.ikuz.org">Ihor Kuz
       <br>
       (co-chair)</a></strong>
    </div>
    <div class="person_affiliation">
      Kry10
    </div>
  </div>

  <div class="person">
    <div class="person_pic">
      <a href="https://nickspinale.com"><img src="../../../images/summit/nick.jpg" alt="Nick Spinale" width="80"/></a>
    </div>
    <div class="person_title">
      <strong><a href="https://nickspinale.com">Nick Spinale
      <br>
       (co-chair)</a></strong>
    </div>
    <div class="person_affiliation">
      Colias Group
    </div>
  </div>

  <div class="person">
    <div class="person_pic">
      <a href="https://www.ncsc.gov.uk/"><img src="../../../images/summit/person-pc.svg" alt="NCSC" width="80"/></a>
    </div>
    <div class="person_title">
      <strong><a href="https://www.ncsc.gov.uk/">Adam (NCSC)</a></strong>
    </div>
    <div class="person_affiliation">
      NCSC
    </div>
  </div>

  <div class="person">
    <div class="person_pic">
    <a href="https://www.linkedin.com/in/alison-felizzi-991244189"><img src="../../../images/summit/alison.jpg" alt="Alison Felizzi" width="80"/></a>
    </div>
    <div class="person_title">
      <strong><a href="https://www.linkedin.com/in/alison-felizzi-991244189">Alison Felizzi</a></strong>
    </div>
    <div class="person_affiliation">
      Kry10
    </div>
  </div>

  <div class="person">
    <div class="person_pic">
      <a href="https://loonwerks.com/people/david-hardin.html"><img src="../../../images/summit/RTX-David.png" alt="David Hardin" width="80"/></a>
    </div>
    <div class="person_title">
      <strong><a href="https://loonwerks.com/people/david-hardin.html">David Hardin</a></strong>
    </div>
    <div class="person_affiliation">
      Collins
    </div>
  </div>

 <div class="person">
    <div class="person_pic">
      <a href="https://evermatos.com/"><img src="../../../images/summit/everton.jpg" alt="Everton de Matos" width="80"/></a>
    </div>
    <div class="person_title">
      <strong><a href="https://evermatos.com/">Everton de Matos</a></strong>
    </div>
    <div class="person_affiliation">
      TII
    </div>
  </div>

  <div class="person">
    <div class="person_pic">
      <a href="https://trustworthy.systems/people/?cn=Gernot+Heiser"><img src="../Foundation/Board/TS-Gernot-s.jpg" alt="Gernot Heiser" width="80"/></a>
    </div>
    <div class="person_title">
      <strong><a href="https://trustworthy.systems/people/?cn=Gernot+Heiser">Gernot Heiser</a></strong>
    </div>
    <div class="person_affiliation">
      UNSW
    </div>
  </div>

  <div class="person">
    <div class="person_pic">
      <!--a href=""><img src="../../../images/summit/.png" alt="Indan Zupancic" width="80"/></a-->
    </div>
    <div class="person_title">
      <strong><a href="">Indan Zupancic</a></strong>
    </div>
    <div class="person_affiliation">

    </div>
  </div>

  <div class="person">
    <div class="person_pic">
      <a href="http://people.cs.ksu.edu/~hatcliff"><img src="../../../images/summit/john.jpg" alt="John Hatcliff" width="80"/></a>
    </div>
    <div class="person_title">
      <strong><a href="http://people.cs.ksu.edu/~hatcliff">John Hatcliff</a></strong>
    </div>
    <div class="person_affiliation">
      KSU
    </div>
  </div>

  <div class="person">
    <div class="person_pic">
      <a href="https://www.linkedin.com/in/lucy-parker-13a484253/">
      <img src="../../../images/summit/lucy.jpg" alt="Lucy Parker" width="80"/></a>
    </div>
    <div class="person_title">
      <strong><a href="https://www.linkedin.com/in/lucy-parker-13a484253/">Lucy Parker</strong></a>
    </div>
  </div>

  <div class="person">
    <div class="person_pic">
      <a href="https://www.linkedin.com/in/mbrcknl/"><img src="../../../images/summit/matthew.jpg" alt="Matthew Brecknell" width="80"/></a>
    </div>
    <div class="person_title">
      <strong><a href="https://www.linkedin.com/in/mbrcknl/">Matthew Brecknell</a></strong>
    </div>
    <div class="person_affiliation">
      Kry10
    </div>
  </div>

  <div class="person">
    <div class="person_pic">
      <a href="https://galois.com/team/michal-podhradsky/
"><img src="../../../images/summit/michal.jpg" alt="Michal Podhradsky" width="80"/></a>
    </div>
    <div class="person_title">
      <strong><a href="https://galois.com/team/michal-podhradsky/
">Michal Podhradsky</a></strong>
    </div>
    <div class="person_affiliation">
      Galois
    </div>
  </div>

  <div class="person">
    <div class="person_pic">
      <a href="https://www.linkedin.com/in/robbie-vanvossen-gr/"><img src="../../../images/summit/robbie.png" alt="Robbie VanVossen" width="80"/></a>
    </div>
    <div class="person_title">
      <strong><a href="https://www.linkedin.com/in/robbie-vanvossen-gr/">Robbie VanVossen</a></strong>
    </div>
    <div class="person_affiliation">
      Dornerworks
    </div>
  </div>
</div>


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
<div class="news-item tag-link" id="summit-2024-location">
  <a href="#summit-2024-location"><span class="tag-span"># </span></a>
  9 February 2024: The seL4 summit 2024 will be held in Sydney, Australia
</div>
<div>
    <a href = "../Foundation/Summit/2024">
    <img src="/images/sel4-summit-logo.svg"
    style="width: 15%; float:right"
    alt="seL4 summit" />
    </a>
    <p>
      It is our pleasure to confirm that the seL4 Summit 2024 will be in:
    </p>
    <p class="highlight">
      Sydney, Australia, Oct 2024 (dates TBC).
    </p>
    <p>
      The summit will be hosted by the <a href="https://events.linuxfoundation.org/">Linux Foundation</a> and will be an in-person event.
    </p>
    <p>
      We will announce a Call for Presentations in the coming weeks. Stay tuned!
    </p>
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
