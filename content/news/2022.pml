<!--<title>News about seL4 and the seL4 Foundation</title>-->
<!--
    Copyright 2022 seL4 Project a Series of LF Projects, LLC.
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
<div class="news-item" id="summit-register">
    18 July 2022: Register for the seL4 summit 2022!
</div>
<div>
  <a href="/Foundation/Summit/">
    <img src="/images/sel4-summit-logo.svg"
    style="width: 20%;  padding-left:10px;  float:right"
	   alt="seL4 summit" />
  </a>
  <p>
    This hybrid event will be held in Munich, Germany, 10-13 October 2022.
  </p>
  <p>
    The seL4 summit will cover the complete seL4 ecosystem, consisting of the verified microkernel, as well as all seL4-related technology, tools, infrastructure, products, projects, and people.
  </p>
  <p>
    Tickets include:
  </p>
  <ul>
    <li>Participation in the 3-day conference, including talks, keynotes, seL4 updates & discussions</li>
    <li>A one-day bootcamp with workshops and trainings</li>
    <li>Networking with other seL4 experts and enthusiasts</li>
    <li>Participation in the mentoring program (for students and junior engineers)</li>
  </ul>
  <p class="highlight">
    <a href="https://hensoldt-cyber.com/sel4-summit-2022/">Register</a> for the seL4 Summit 2022!
  </p>
</div>

<!----------------------------------------------------------->
<div class="news-item" id="program-online">
    30 June 2022: The seL4 summit Program is available!
</div>
<div>

  <p>
    <a href="/Foundation/Summit/">
      <img src="/images/sel4-summit-logo.svg"
	   style="width: 20%;  padding-left:10px;  float:right"
	   alt="seL4 summit" />
    </a>

    Have a look at the <a href="../Foundation/Summit/program">seL4 summit Program</a>!
    We have an amazing line-up of cool seL4 work, with a combination of
    technical research and development, experience reports of seL4 in the field,
    technical discussions and Birds-of-a-feather sessions, as well as a whole
    day of seL4 bootcamp with tutorials and training.

  <p style="text-align: center;">

    <a href="../Foundation/Summit/program">
      <img src="../images/summit/program.svg"
	   style="width: 70%;  padding-left:10px; "
	   alt="seL4 Summit program" />
    </a>

  </p>
</div>
<div class="news-finish">
</div>

<!----------------------------------------------------------->


<div class="news-item" id="member-latticex">
  17 June 2022: LatticeX joins the seL4 Foundation
</div>
<div>
  <p>
    <a href="https://latticex.foundation/home">
      <img src="/Foundation/Membership/LOGOS/latticex.png"
	   style="width: 20%;  padding-left:10px;  float:right"
	   alt="LatticeX" />
    </a>
    The seL4 Foundation is pleased to welcome <a href="https://latticex.foundation/home">Lattice X</a>.
    <br>
    <br>
    LatticeX Foundation cultivates academic research, technology advancements and industrial applications in the fields that foster the development of LatticeX ecosystem.
    <br>
    <br>
    LatticeX is the vision of large-scale distributed network supporting the expansive economy activities and broader business applications where users can recognize the sovereignty and privacy of their own data, and leverage the ecosystem of sophisticated computing technologies to collaboratively unearth the value of data and benefit from data-value transactions throughout.
    <br>
    <br>
    Yuning Liang, LatticeX Foundation Security Advisor said: "We are so glad to join seL4 foundation. Hopefully, we can specialise seL4 technology into the web 3.0 domain from cross chain bridge node OS to hardware wallet OS for improving their security and stability."
    </p>
    <p>
  </p>
</div>
<div class="news-finish">
</div>


<!----------------------------------------------------------->
<div class="news-item" id="cfp-reminder">
    2 May 2022: One week left to propose a talk at the seL4 summit 2022!
</div>
<p>
A reminder that you have until Monday 9th of May 2022 to <a href="../Foundation/Summit/cfp">propose a talk</a> for the seL4 Summit 2022.
</p>
<p>
    <video width="320" height="240" controls>
      <source src="sel4-summit-last-call.mp4" type="video/mp4">
      Your browser does not support the video tag.
    </video>
</p>
<div class="news-item" id="summit-venue">
    29 April 2022: The seL4 Summit 2022 will be in Munich, Germany, on 10-13 Oct 2022
</div>
<div>
    <a href="../Foundation/Summit">
      <img src="../images/sel4-summit-logo.svg"
	   style="width: 20%;  padding-left:10px;  float:right"
	   alt="seL4 Summit 2022" />
    </a>

    <p>
    It is our pleasure to confirm that the <a href="../Foundation/Summit">seL4
    Summit 2022</a> will be in:
    </p>

    <div class="highlight"><p>Munich, Germany in the week of Oct 10th, 2022</p></div>

    <p>

    It will be hosted by seL4 Foundation member
    <a href="http://hensoldt-cyber.com/">Hensoldt Cyber</a>.
    It will be a hybrid in-person/online event.
    <strong>If you'd like to propose a talk to be delivered
    remotely, please notify it in the submission.</strong>

    </p>


    <p>
    Remember that you have until Monday 9th of May 2022 to
    <a href="../Foundation/Summit/cfp">propose a talk</a>.
    </p>

    <div class="highlight" style="text-align: center">
    <p>Share your seL4 work </p>
    <p>Share your seL4 experience </p>
    <p>Share your seL4 thoughts </p>
    <p>Share your seL4 questions </p>
    </div>



</div>
<div class="news-finish">
</div>


<!----------------------------------------------------------->
<div class="news-item" id="tm-2022">
    11 April 2022: The seL4<sup>&reg;</sup> trademark is now registered in the US
</div>
<div>
    <a href="../">
      <img src="/images/seL4.svg"
	   style="width: 20%;  padding-left:10px;  float:right"
	   alt="seL4"/>
    </a>
    <p>
    The Linux Foundation has registered seL4<sup>&reg;</sup> as a trademark in the United States and other countries. We encourage the use of the <a href="../Foundation/Trademark/logo.pml">seL4<sup>&reg;</sup> name and logo</a>
  in your work, following the usage rules <a href="../Foundation/Trademark/">here</a>.
    </p>
</div>
<div class="news-finish">
</div>


<!----------------------------------------------------------->
<div class="news-item" id="agm-2022">
  6 April 2022: Our second annual AGM to be held 6 April 2022
</div>
<div>
    <a href="../Foundation/">
      <img src="../images/sel4-foundation-logo.svg"
	   style="width: 20%;  padding-left:10px;  float:right"
	   alt="seL4 Foundation"/>
    </a>
  <p>
    Our second Annual General Meeting (AGM) 6 April 2022. As our membership now is truly global, covering New Zealand, Australia, China, the Middle East, Central and Western Europe, the US East, Central and West coasts, there is no time that is not in the middle of the night for some members. Hence we will hold the AGM in two sessions:
    </p>
    <ul>
      <li>2022-04-06 07:00–08:30 UTC</li>
      <li>2022-04-06 23:00 – 2022-04-07 00:30 UTC</li>
    </ul>
</div>
<div class="news-finish">
</div>

<!----------------------------------------------------------->
<div class="news-item" id="summit-cfp">
  30 March 2022: The Call for Presentations for the seL4 summit 2022 is out!
</div>
<div>


    <a href="../Foundation/Summit">
      <img src="../images/sel4-summit-logo.svg"
	   style="width: 20%;  padding-left:10px;  float:right"
	   alt="seL4 Summit 2022" />
    </a>

<div class="highlight" >

  <h3>
  We are <a href="../Foundation/Summit/cfp">calling for proposals to present</a> at the <a
  href="../Foundation/Summit">seL4 Summit 2022</a>.
  </h3>
  <p>Share your seL4 work </p>
  <p>Share your seL4 experience </p>
  <p>Share your seL4 thoughts </p>
  <p>Share your seL4 questions </p>
</div>


  <p>

  Check the full <a href="../Foundation/Summit/cfp">Call For Presentations</a>.  To propose a talk,
  send an abstract of <strong>one page or less</strong> <strong>by Monday 9th of
  May 2022</strong> to <a title="summit@sel4.systems"
  href="mailto:summit@sel4.systems">summit@sel4.systems</a>.  </p>


</div>
<div class="news-finish">
</div>


<!----------------------------------------------------------->
<div class="news-item" id="summit-pc">
  18 March 2022: Meet the Program Committee of the seL4 summit 2022!
</div>
<div>


    <a href="../Foundation/Summit">
      <img src="../images/sel4-summit-logo.svg"
	   style="width: 20%;  padding-left:10px;  float:right"
	   alt="seL4 Summit 2022" />
    </a>

  <p>

    The seL4 Foundation is excited to have gathered a top notch team of
    people to serve as <a href="../Foundation/Summit">PC members for the seL4
    summit 2022</a>. They come from across the the seL4 ecosystem: users,
    contributors, committers, experts, advocates, researchers, and engineers.

  </p>
  <p>

    <strong>Stay tuned for the Call for Presentation soon!</strong>

  </p>
  <p style="text-align: center;">

    <a href="../Foundation/Summit">
      <img src="../images/summit/pc22.png"
	   style="width: 60%;  padding-left:10px; "
	   alt="PC for seL4 Summit 2022" />
    </a>

  </p>


</div>
<div class="news-finish">
</div>

<!----------------------------------------------------------->
<div class="news-item" id="board-member-olivier">
  14 March 2022: Olivier Engelkes is Hensoldt Cyber's new representative on the seL4 Board
</div>
<div>

    <a href="https://de.linkedin.com/in/olivier-engelkes-6393b1a">
      <img src="/Foundation/Board/HC-Olivier.jpg"
	   style="width: 20%;  padding-left:10px;  float:right"
	   alt="Olivier Engelkes" />
    </a>


  <p>
    The seL4 Foundation is pleased to welcome <a href="https://de.linkedin.com/in/olivier-engelkes-6393b1a">Olivier Engelkes</a> as Hensoldt Cyber's new representative on the <a href="../Foundation/Board">seL4 Foundation Board</a>.
    </p>
  <p>
      Olivier is  Head of Engineering at HENSOLDT Cyber GmbH, <a href="../Foundation/Membership">premium member</a> of the seL4 Foundation and Munich-based company which develops embedded IT products that meet the highest security requirements, combining an operating system based on verified seL4 with a RISC-V processor that is protected from supply-chain attacks. Olivier replaces Sascha Kegrei&szlig; as HENSOLDT Cyber's representative on the
      <a href="../Foundation/Board">seL4 Foundation Board</a>.
  </p>

</div>
<div class="news-finish">
</div>

<!----------------------------------------------------------->
<div class="news-item" id="member-ncsc">
  2 February 2022: NCSC joins the seL4 Foundation
</div>
<div>

  <p>
    <a href="https://www.ncsc.gov.uk/">
      <img src="/Foundation/Membership/LOGOS/NCSC.png"
	   style="width: 20%;  padding-left:10px;  float:right"
	   alt="NCSC" />
    </a>

    The seL4 Foundation is pleased to welcome the UK’s <a href="https://www.ncsc.gov.uk">National Cyber Security Centre (NCSC)</a>.
    </p>
    <p>

    The NCSC, the UK’s technical authority on cyber security, uses the seL4
    Microkernel to enforce separation in a number of high-assurance
    situations. The government organisation is actively exploring research
    opportunities to further develop its seL4 use cases.  NCSC Technical
    Director Dr Ian Levy said: "We’re pleased to join the seL4 Foundation. seL4
    is some of the most highly assured software and its development plays an
    important role in the next generation of high-assurance devices. We support
    the long-term stability of the seL4 microkernel ecosystem and are looking at
    opportunities to develop our use cases for it."
  </p>

</div>
<div class="news-finish">
</div>

<!----------------------------------------------------------->
<div class="news-item" id="summit-bid-host">
  1 February 2022: Call for bids to host the seL4 Summit 2022!
</div>
<div>

  <p>
    <a href="/Foundation/Summit/">
      <img src="/images/seL4.svg"
	   style="width: 20%;  padding-left:10px;  float:right"
	   alt="seL4 summit" />
    </a>

  The seL4 Foundation will be organising the fourth edition of the seL4 Summit,
  in October 2022.
  </p>
  <p>
  A Program Committee will be in charge of the technical side (more on that
  soon) and an Hosting Team will be in charge of organising the event.
  </p>
  <p>
  <strong> We are now calling for bids to be the Host team for the seL4 Summit 2022!
  </strong>
  </p>
  <p>
  <strong>

  Bids should be sent to <a title="summit@sel4.systems"
  href="mailto:summit@sel4.systems">summit@sel4.systems</a> before 22 February
  2022.
  </strong>
  </p>
  <p>
  More information <a href="/Foundation/Summit/">here</a>.
  </p>

</div>
<div class="news-finish">
</div>


<!----------------------------------------------------------->
<div class="news-item" id="kry10-endorsement">
  28 January 2022: Kry10 receives interim endorsement as a Trusted Service Provider
</div>
<div>
  <p>
    <a href="https://kry10.com">
      <img src="/Foundation/Membership/LOGOS/Kry10.svg"
	   style="width: 20%;  padding-left:10px;  float:right"
	   alt="Kry10 logo" />
    </a>
    The seL4 Foundation has awarded Interim Endorsement to Kry10 as a Trusted Service Provider. More on our <a href="../Foundation/Services/">Services, Training and Products</a> page.
  </p>
</div>
<div class="news-finish">
</div>
