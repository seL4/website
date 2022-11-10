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
<div class="news-item" id="summit-videos">
    11 November 2022: The videos and slides of the seL4 summit 2022 are available online
</div>
<div>
  <a href="/Foundation/Summit/">
    <img src="/images/sel4-summit-logo.svg"
    style="width: 20%;  padding-left:10px;  float:right"
    alt="seL4 summit" />
  </a>
  <p>
    Videos of the seL4 summit 2022 are now available on the <a href="https://www.youtube.com/@seL4" target="_blank">seL4 YouTube channel</a>! Links and slides can be found on the summit <a href="../Foundation/Summit/program">Program</a> and <a href="../Foundation/Summit/abstracts2022">Abstracts</a> pages. Thanks to all the speakers for making the seL4 summit 2022 a great success!
  </p>
</div>
<div class="news-finish">
</div>



<!----------------------------------------------------------->
<div class="news-item" id="gday-kataos">
    21 October 2022: G’Day KataOS
</div>
<div>
  <a href="https://www.google.com/">
    <img src="/Foundation/Membership/LOGOS/google-short.svg" style="width: 20%;  padding-left:10px;  float:right" alt="Google" />
  </a>
  <p>
   The seL4 Foundation welcomes the <a href="https://opensource.googleblog.com/2022/10/announcing-kataos-and-sparrow.html">open-sourcing of core components of KataOS</a> created by our Member <a href="https://google.com">Google</a>. KataOS is based on seL4 and implemented mostly in the <a href="https://www.rust-lang.org">Rust programming language</a>. KataOS is to be combined with a secure hardware platform on the RISC-V architecture.
  </p>
  <p>
  This is an exciting addition to the seL4 ecosystem that will ease deployment of seL4-based systems. It also adds improved support for <a href="https://antmicro.com/blog/2022/08/running-rust-programs-in-sel4/">running Rust programs on seL4</a>, which is a hot topic in the seL4 community.
</div>
<div class="news-finish">
</div>


<!----------------------------------------------------------->
<div class="news-item" id="summit-xcalibyte">
    7 October 2022: Thanks Xcalibyte for sponsoring the seL4 Summit 2022
</div>
<div>
  <p>
   <a href="https://xcalibyte.com">
     <img src="/Foundation/Membership/LOGOS/xcalibyte.svg"
	  style="width: 15%;  padding-left:10px;  float:right"
	  alt="Xcalibyte logo">
   </a>
  </p>
  <p>
    The seL4 Foundation thanks <a href="https://xcalibyte.com">Xcalibyte</a> for becoming a Bronze sponsor of the <a href="/Foundation/Summit/">seL4 Summit 2022</a>.
  </p>
  <p>
    Xcalibyte's mission is to improve the quality of software by
   creating easy-to-use tools that help developers build and deploy
   reliable and secure code. Founded by world-class software experts
   with decades of experience in compiler optimization and software
   development, Xcalibyte was established in 2018 and has offices in
   Shenzhen, Shanghai, Beijing and Hong Kong. Xcalibyte enhances the
   speed and accuracy of code auditing, code evaluation, and code
   defect detection. We use advanced static code analysis to help
   reduce costs, improve productivity, and ensure software developers
   in China and all over the world have the proper capabilities to
   develop better, more reliable software.
  </p>
</div>
<div class="news-finish">
</div>


<!----------------------------------------------------------->
<div class="news-item" id="summit-panellists">
    26 September 2022: Panellists for seL4 summit announced
</div>
<div>
  <p>
    We are very fortunate to welcome four leaders at major funding agencies to participate in a session <a href="../Foundation/Summit/abstracts2022#a-Funding-agencies"><strong>Funding agencies: priorities and vision</strong></a> at the <a href="/Foundation/Summit/">seL4 summit</a>. They will each give their views on the priorities and vision of their agency in terms of high-assurance systems.
  </p>
</div>
<div class="speakers_grid">
  <div class="speaker">
    <div class="speaker_pic">
      <img src="../../images/summit/brad.jpg" alt="William “Brad” Martin" width="140"/>
    </div>
    <div class="speaker_title" style="text-align:center">
      <a href="/Foundation/Summit/abstracts2022#a-Funding-agencies-darpa">William “Brad” Martin</a>
      <br>
      <a href="https://www.darpa.mil/">DARPA</a>
    </div>
  </div>
  <div class="speaker">
    <div class="speaker_pic">
      <img src="../../images/summit/paul.jpg" alt="Paul Waller" width="140"/>
    </div>
    <div class="speaker_title" style="text-align:center">
      <a href="/Foundation/Summit/abstracts2022#a-Funding-agencies-ncsc">Paul Waller</a>
      <br>
      <a href="https://www.ncsc.gov.uk/">NCSC</a>
    </div>
  </div>
  <div class="speaker">
    <div class="speaker_pic">
      <img src="../../images/summit/cyberagentur.png" alt="Cyberagentur" width="140"/>
    </div>
    <div class="speaker_title" style="text-align:center">
      <a href="/Foundation/Summit/abstracts2022#a-Funding-agencies-cyberagentur">Sebastian Jester</a>
      <br>
      <a href="https://www.cyberagentur.de/">Cyberagentur</a>
    </div>
  </div>
  <div class="speaker">
    <div class="speaker_pic">
      <img src="../../images/summit/ticky.jpg" alt="Dr. Shreekant (Ticky) Thakkar" width="140"/>
    </div>
    <div class="speaker_title" style="text-align:center">
      <a href="/Foundation/Summit/abstracts2022#a-Funding-agencies-tii">Shreekant (Ticky) Thakkar</a>
      <br>
      <a href="https://www.tii.ae/">TII</a>
    </div>
  </div>
</div>
<div class="news-finish">
</div>

<!----------------------------------------------------------->
<div class="news-item" id="summit-dornerworks">
    19 September 2022: Thanks DornerWorks for sponsoring the seL4 Summit 2022
</div>
<div>
  <p>
    <a href="https://dornerworks.com/">
    <img src="/Foundation/Membership/LOGOS/DornerWorks.svg" style="width: 20%;  padding-left:10px;  float:right"
              alt="DornerWorks logo">
        </a>
  </p>
  <p>
    The seL4 Foundation thanks <a href="https://dornerworks.com/">DornerWorks</a> for becoming a Bronze sponsor of the <a href="/Foundation/Summit/">seL4 Summit 2022</a>.
  </p>
  <p>
    <a href="https://dornerworks.com/">DornerWorks</a> helps product makers turn their ideas into reality with FPGA, hardware, and embedded software engineering expertise. Among other areas, DornerWorks specialises in seL4 microkernel-based development.
  </p>
  <p>
    Innovative companies are building products on a trusted software base with the guidance of DornerWorks engineers. As a founding member of the seL4 Foundation, DornerWorks can accelerate the integration of seL4 as the trusted software base for your products.
  </p>
  <p>
    If you are interesting in sponsoring the seL4 summit 2022, please contact <a title="summit@sel4.systems" href="mailto:summit@sel4.systems">summit@sel4.systems</a>.
  </p>
</div>
<div class="news-finish">
</div>

<!----------------------------------------------------------->
<div class="news-item" id="summit-horizon">
    9 September 2022: Thanks Horizon Robotics for sponsoring the seL4 Summit 2022
</div>
<div>
  <p>
    <a href="https://horizon.ai/">
    <img src="/Foundation/Membership/LOGOS/Horizon_Robotics.svg" style="width: 20%;  padding-left:10px;  float:right"
              alt="Horizon Robotics logo">
        </a>
  </p>
  <p>
    The seL4 Foundation thanks <a href="https://horizon.ai/">Horizon Robotics</a> for becoming a Bronze sponsor of the <a href="/Foundation/Summit/">seL4 Summit 2022</a>.
  </p>
  <p>
    Horizon Robotics is a leading provider of computing platforms for smart vehicles with the mission to make human life safer and better.
  </p>
  <p>
    Premium member of the seL4 Foundation, Horizon works with members of seL4 Foundation to build mixed-critical platform and solution for next-generation autonomous driving vehicles.
  </p>
  <p>
    If you are interesting in sponsoring the seL4 summit 2022, please contact <a title="summit@sel4.systems" href="mailto:summit@sel4.systems">summit@sel4.systems</a>.
  </p>
</div>
<div class="news-finish">
</div>

<!----------------------------------------------------------->
<div class="news-item" id="member-spacemit">
    31 August 2022: SpacemiT joins the seL4 Foundation
</div>
<div>
  <p>
  <a href="https://spacemit.com/en/">
      <img src="/Foundation/Membership/LOGOS/SpacemiT.svg" style="width: 20%;  padding-left:10px;  float:right" alt="SpacemiT" />
  </a>
  </p>
  <p>
    The seL4 Foundation welcomes <a href="https://spacemit.com/en/">SpacemiT</a> as a member.
  </p>
  <p>
    SpacemiT, a semiconductor innovation company focusing on high-performance RISC-V architecture chips, announced that it has officially joined the seL4 Foundation. SpacemiT will work closely with seL4 to promote RISC-V+seL4 and will also focus on the security and performance of the operating system, thus assuring confidence in the security of the RISC-V architecture.
  </p>
</div>
<div class="news-finish">
</div>

<!----------------------------------------------------------->
<div class="news-item" id="registration-open">
    15 August 2022: Register for the seL4 Summit!
</div>
<div>

  <p>
    <a href="/Foundation/Summit/">
      <img src="/images/sel4-summit-logo.svg"
	   style="width: 20%;  padding-left:10px;  float:right"
	   alt="seL4 summit" />
    </a>
</p>
<p>
  This hybrid event will be held in Munich, Germany, 10-13 October 2022.
</p>
<p>
  The seL4 summit will cover the complete seL4 ecosystem, consisting of the verified microkernel, as well as all seL4-related technology, tools, infrastructure, products, projects, and people.
</p>
<p>
  <strong>Tickets include:</strong>
</p>
<ul>
  <li>Participation in the 3-day conference, including talks, keynotes, seL4 updates & discussions</li>
  <li>A one-day bootcamp with workshops and trainings</li>
  <li>Networking with other seL4 experts and enthusiasts</li>
  <li>Participation in the mentoring program (for students and junior engineers)</li>
</ul>

<p>
  <strong>Mentorship program</strong>
</p>
<p>
  As part of the registration process, attendees have the opportunity to opt-in to a new, informal mentorship program. The purpose of this program is to foster mentorship relationships within the seL4 community. The program committee will match students and junior engineers who wish to participate as mentees with volunteer mentors. Participating attendees will be introduced to their counterparts during the summit, and will carry on afterwards with whatever level of involvement suits both parties. Mentors are welcome to volunteer for any level of involvement.
</p>
<a href="https://hopin.com/events/sel4-summit-2022/registration">
  <div class="highlight" style="text-align: center">
    Register for the seL4 Summit 2022!
  </div>
</a>

</div>
<div class="news-finish">
</div>

<!----------------------------------------------------------->
<div class="news-item" id="member-google">
    4 August 2022: Google joins the seL4 Foundation
</div>
<div>

  <p>
    <a href="https://www.google.com/">
      <img src="/Foundation/Membership/LOGOS/google-short.svg" style="width: 20%;  padding-left:10px;  float:right" alt="Google" />
     </a>

   The seL4 Foundation is pleased to welcome <a href="https://www.google.com/">Google</a> as our latest member.
    <br>
    <br>
    We are excited to see their interest in seL4 and look forward to seeing their work with seL4.
  </p>
</div>
<div class="news-finish">
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
    <a href="https://latticex.foundation/">
      <img src="/Foundation/Membership/LOGOS/latticex.png"
	   style="width: 20%;  padding-left:10px;  float:right"
	   alt="LatticeX" />
    </a>
    The seL4 Foundation is pleased to welcome <a href="https://latticex.foundation/">Lattice X</a>.
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
    29 April 2022: The seL4 Summit 2022 will be in Munich, Germany, on 10-12 Oct 2022
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
