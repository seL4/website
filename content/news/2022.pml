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
  </p>
  <p>
      Olivier is  Head of Engineering at HENSOLDT Cyber GmbH, <a href="../Foundation/Membership">premium member</a> of the seL4 Foundation and Munich-based company which develops embedded IT products that meet the highest security requirements, combining an operating system based on verified seL4 with a RISC-V processor that is protected from supply-chain attacks. Olivier replaces Sascha Kegrei&szlig; as HENSOLDT Cyber's representative on the
      <a href="../Foundation/Board">seL4 Foundation Board</a>. </td>
  </p>

</div>
<div class="news-finish">
</div>

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
  <p>
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
