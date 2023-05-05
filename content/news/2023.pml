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
<div class="news-item" id="acm-award">
    5 May 2023: seL4 receives the ACM Software System Award!
</div>
<div>
  <a href = "https://awards.acm.org/software-system">
    <img src="/images/acm-2023.svg"
    style="width: 40%; float:right;"
    alt="ACM Award Winners" />
  </a>
  <p>
  The <a href= "https://awards.acm.org/software-system">2022 ACM Software System Award</a> recognises seL4 as the first industrial-strength, high-performance operating system to have been the subject of a complete, mechanically-checked proof of full functional correctness, proofs of enforcement of the core security properties of integrity and confidentiality, a proof to the binary code of the kernel, and the first sound and complete worst-case execution-time analysis of a protected mode OS.
  </p>
  <p>
    The award, recognising the development of a software system that has had a lasting influence, goes to Gernot Heiser, University of New South Wales; Gerwin Klein, Proofcraft; Harvey Tuch, Google; Kevin Elphinstone, University of New South Wales; June Andronick, Proofcraft; David Cock, ETH Zurich; Philip Derrin, Qualcomm; Dhammika Elkaduwe, University of Peradeniya; Kai Engelhardt; Toby Murray, University of Melbourne; Rafal Kolanski, Proofcraft; Michael Norrish, Australian National University; Thomas Sewell, University of Cambridge; and Simon Winwood, Galois.
  </p>
  <p>
    We are committed to make sure that seL4's recognised "lasting influence" live on for the decades ahead!
  </p>
</div>


<!----------------------------------------------------------->
<div class="news-item" id="summit-2023-venue">
    14 April 2023: Dates and venue confirmed for the <a href="../Foundation/Summit/2023/">seL4 summit 2023</a>.
</div>
<div>
  <a href = "../Foundation/Summit">
    <img src="/images/sel4-summit-logo.svg"
    style="width: 15%; float:right"
    alt="seL4 summit" />
  </a>
  <p>
    The <a href="../Foundation/Summit/2023">seL4 Summit 2023</a> will be held <strong>19 - 21 September 2023 at the <a href="https://www.elliotparkhotel.com/">Elliot Park Hotel</a>, Minneapolis, USA</strong>.
  </p>
  <p>
    The summit will be hosted by the Linux Foundation, and will be an in-person event.
  </p>
  <p>
    Registration details to follow soon!
  </p>
  <p>
    Remember that you have until <strong>24 April 2022</strong> to <a href="../Foundation/Summit/2023/cfp">propose a talk</a>. To propose a talk, upload an abstract of one page or less to the <strong><a href="../Foundation/Summit/2023/submit">submission portal</a></strong>.
  </p>
</div>


<!----------------------------------------------------------->
<div class="news-item" id="member-autoware">
  22 March 2023: The Autoware Foundation joins the seL4 Foundation
</div>
<div>
  <a href = "https://www.autoware.org/">
    <img src="/Foundation/Membership/LOGOS/autoware.svg"
    style="width: 15%; float:right"
    alt="Autoware Foundation" />
  </a>
  <p>
  The seL4 Foundation welcomes <a href = "https://www.autoware.org/">the Autoware Foundation</a> as a <a href="/Foundation/Membership">member</a>.
  </p>
  <p>
    The Autoware Foundation hosts the Autoware Project, the world’s leading open-source software project for autonomous driving.
  </p>
  <p>
    As a member of the seL4 Foundation, the Autoware Foundation will work with members of the seL4 Foundation to implement a safe and secure Autonomous Driving software stack based on Autoware, leveraging the formally-verified and mixed-criticality capabilities of seL4.
  </p>
</div>

<!----------------------------------------------------------->
<div class="news-item" id="summit-2023-cfp">
    20 February 2023: <a href="../Foundation/Summit/2023/cfp">Call For Presentations</a> for the <a href="../Foundation/Summit/">seL4 Summit 2023</a>
</div>
<div>
  <a href = "../Foundation/Summit">
    <img src="/images/sel4-summit-logo.svg"
    style="width: 15%; float:right"
    alt="seL4 summit" />
  </a>
  <h3 class="highlight">
   <a href="../Foundation/Summit/2023/cfp">Call For Presentations</a> for the <a href="../Foundation/Summit/">seL4 Summit 2023</a>
  </h3>
  <ul>
  <li>Share your seL4 work</li>
  <li>Share your seL4 experience</li>
  <li>Share your seL4 thoughts</li>
  </ul>
  <p>
    Check the full <a href="../Foundation/Summit/2023/cfp">Call For Presentations</a>. To propose a talk, upload an abstract of one page or less by <strong>10 April 2023</strong> to the <strong><a href="../Foundation/Summit/2023/submit">submission portal</a></strong>.
  </p>
</div>

<!----------------------------------------------------------->
<div class="news-item" id="summit-2023-pc">
    13 February 2023: Meet the Program Committee of the seL4 summit 2023
</div>
<div>
    <a href = "../Foundation/Summit">
    <img src="/images/sel4-summit-logo.svg"
    style="width: 15%; float:right"
    alt="seL4 summit" />
    </a>
    <p>
      We are thrilled to announce our program committee for the <a href="../Foundation/Summit/">seL4 Summit 2023</a>.
      Our awesome team comes from various parts of the seL4 ecosystem: users, contributors, committers, experts, advocates, researchers, and engineers.
    </p>
</div>
<div class="people_grid">
  <div class="person">
    <div class="person_pic">
      <a href="http://loonwerks.com/people/darren-cofer.html"><img src="../../../images/summit/darren.jpg" alt="Darren Cofer" width="80" /></a>
    </div>
    <div class="person_title">
      <strong><a href="http://loonwerks.com/people/darren-cofer.html">Darren Cofer
      <br>(co-chair)</a></strong>
    </div>
    <div class="person_affiliation">
      Raytheon
    </div>
  </div>

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
      <a href="https://perry.alexander.name"><img src="../../../images/summit/perry.jpg" alt="Perry Alexander" width="80"/></a>
    </div>
    <div class="person_title">
      <strong><a href="https://perry.alexander.name">Perry Alexander</a></strong>
    </div>
    <div class="person_affiliation">
      U of Kansas
    </div>
  </div>

  <div class="person">
    <div class="person_pic">
      <a href="https://proofcraft.systems/#june"><img src="../Foundation/Board/TS-June-s.jpg" alt="June Andronick" width="80" /></a>
    </div>
    <div class="person_title">
      <strong><a href="https://proofcraft.systems/#june">June Andronick</a></strong>
    </div>
    <div class="person_affiliation">
      Proofcraft
    </div>
  </div>

  <div class="person">
    <div class="person_pic">
      <a href="https://galois.com/team/todd-carpenter/"><img src="../../../images/summit/todd.jpg" alt="Todd Carpenter" width="80"/></a>
    </div>
    <div class="person_title">
      <strong><a href="https://galois.com/team/todd-carpenter/">Todd Carpenter</a></strong>
    </div>
    <div class="person_affiliation">
      Galois Inc
    </div>
  </div>

  <div class="person_no_link">
    <div class="person_pic">
      <img src="../../../images/summit/alison.jpg" alt="Alison Felizzi" width="80"/>
    </div>
    <div class="person_title">
      <strong>Alison Felizzi</strong>
    </div>
    <div class="person_affiliation">
      Kry10
    </div>
  </div>

  <div class="person">
    <div class="person_pic">
      <a href="https://www.linkedin.com/in/axelheider"><img src="../../../images/summit/axel.png" alt="Axel Heider" width="80" /></a>
    </div>
    <div class="person_title">
      <strong><a href="https://www.linkedin.com/in/axelheider">Axel Heider</a></strong>
    </div>
    <div class="person_affiliation">
      Hensoldt Cyber
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
      <a href="https://trustworthy.systems/people/?cn=Lucy+Parker"><img src="../../../images/summit/lucy.jpg" alt="Lucy Parker" width="80"/></a>
    </div>
    <div class="person_title">
      <strong><a href="https://trustworthy.systems/people/?cn=Lucy+Parker">Lucy Parker</a></strong>
    </div>
    <div class="person_affiliation">
      UNSW
    </div>
  </div>

  <div class="person">
    <div class="person_pic">
      <a href="https://nickspinale.com"><img src="../../../images/summit/nick.jpg" alt="Nick Spinale" width="80"/></a>
    </div>
    <div class="person_title">
      <strong><a href="https://nickspinale.com">Nick Spinale</a></strong>
    </div>
    <div class="person_affiliation">
      Colias Group
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


  <div class="person">
    <div class="person_pic">
      <a href="https://www.ncsc.gov.uk/"><img src="../../../images/summit/person-pc.svg" alt="NCSC" width="80"/></a>
    </div>
    <div class="person_title">
      <strong><a href="https://www.ncsc.gov.uk/">Martin (NCSC)</a></strong>
    </div>
    <div class="person_affiliation">
      NCSC
    </div>
  </div>

</div>



<!----------------------------------------------------------->
<div class="news-item" id="summit-2023-minneapolis">
    10 February 2023: The seL4 summit 2023 will be held in Minneapolis, USA
</div>
<div>
    <a href = "../Foundation/Summit">
    <img src="/images/sel4-summit-logo.svg"
    style="width: 15%; float:right"
    alt="seL4 summit" />
    </a>
    <p>
      It is our pleasure to confirm that the <a href="../Foundation/Summit/">seL4 Summit 2023</a> will be in:
    </p>
      <div class="highlight">Minneapolis, USA, Sept/Oct 2023 (dates TBC).</div>
  <p>
    <br>
    The summit will be hosted by the <a href="https://www.linuxfoundation.org/">Linux Foundation</a>, and will be an in-person event.
  </p>
  <p>
    We will announce a Call for Presentations in the coming weeks. Stay tuned!
  </p>
</div>

<div class="news-finish">
</div>
