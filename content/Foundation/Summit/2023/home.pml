<!--<title>Summit</title>-->
<!--
    Copyright 2023 seL4 Project a Series of LF Projects, LLC.
    SPDX-License-Identifier: CC-BY-SA-4.0
-->
<h1>
  seL4 Summit 2023
</h1>
<h4>
Minneapolis, USA
</h4>
<h4>
  19 - 21 September 2023
</h4>

<div class="summit_div">
  <ul>
    <li><a href="#summit-news">Latest News: Keynotes announced</a></li>
    <li><a href="#summit-important-dates">Important Dates</a></li>
    <li><a href="#summit-about">About</a></li>
    <li><a href="cfp">Call for Presentations</a></li>
    <!--li><a href="../principles/">Principles</a></li-->
    <li><a href="#summit-registration">Registration</a></li>
    <li><a href="#summit-location">Location and Venue</a></li>
    <li><a href="#summit-pc">Program Committee</a></li>
    <li><a href="#summit-contact">Contact</a></li>
    <li>Other summit editions: <a href="../2022/">2022</a></li>
  </ul>
</div>

<div class="summit_div">
  <div class="highlight">
    <h3 id="summit-news">
      Latest News
    </h3>
  </div>
  <h3 class="highlight">
    Keynotes announced
  </h3>
  <p>
    We are pleased to announce that the two keynotes for the seL4 summit 2023 will be Gage from NCSC and Sam Leffler from Google!
  </p>
  <img src="/Foundation/Membership/LOGOS/NCSC.png"
      style="width: 25%;"
      alt="NCSC logo" />
    <img src="../../../images/summit/sam-security-photo.jpg"
    style="width: 15%; padding-left:10px"
    alt="Sam Leffler" />

  <p id="abstract-gage">
    <strong>Gage</strong> is an Assurance Lead in NCSC with expertise in cryptography, software assurance and verification. He is part of a larger team that seeks to provide assurance and articulate risk for a wide range of products and customers. Whilst he is not a product developer himself, he has been responsible for presenting assurance cases for products that rely on seL4 to uphold security requirements.
  </p>
  <p>
    Gage will talk about "Scoping assurance activities with seL4"
  </p>
  <p>
    In both the safety and security industries, high levels of product assurance are sought to mitigate the risk of product failure. Often this means that software developers need to demonstrate that all functions do what they are supposed to do, the product does not do anything it is not supposed to do, and that the product is free from all known bugs and vulnerabilities.
  </p>
  <p>
    Whilst none of these requirements have trivial solutions, testing does a reasonable job of checking the correctness of functions. Similarly, taking advantage of tooling (such as static analysis, dynamic analysis), tracking the discovery of bugs and vulnerabilities, and having a refined software patching process helps to mitigate the presence of bugs and vulnerabilities.
  </p>
  <p>
    However, it is much less obvious how one can gain confidence that the software has no unintended functionality without checking the entire software implementation. Even then, the scope of what you need to check is potentially unbounded (we’re looking for the unknown unknowns after all), issues will still be missed, and the resource requirements are high.
  </p>
  <p>
    In this talk, I will describe how basing a software product on seL4 facilitates the scoping of this no unintended functionality problem, and in turn, reduces the amount of effort required when it comes to demonstrating assurance of a security product. By walking through an example, we’ll observe the assurance benefits of component isolation, data flow control, how seL4 helps to direct where we should focus our assurance efforts, and any caveats we should be aware of.
  </p>
  <p>
    Accepting that the assurance effort should be commensurate with the criticality of the security product, my hope is that this presentation provides a sliding scale of seL4 features we should seek to take advantage of, be it for articulating an assurance case, or conducting an independent assessment.
  </p>
  <p>
    <strong>Sam Leffler</strong> has worked at Google for nearly 15 years. He was part of the original team that developed ChromeOS and the ChromeBook, was responsible for the networking components of Project Loon, and worked on various infrastructure projects before joining Project Sparrow to help build the CantripOS embedded operating system.
  </p>
  <p>
    Prior to joining Google he was an independent contractor focused on wireless networking and operating systems. Before contracting he worked for VMware, Silicon Graphics, Pixar, Lucasfilm, and the Computer System Research Group (CSR) at UC Berkeley where he was responsible for the 4.2BSD release of the UNIX operating system. At CSRG he co-designed and implemented many of the facilities found in contemporary UNIX systems including sockets, networking support (IP/TCP), reliable signals, and more.
  </p>

  <p id="abstract-sam">
    Sam will talk about "CantripOS: An OS for Ambient ML Applications"
  </p>
  <p>
    CantripOS is an open source operating system purpose-built to run ML workloads for embedded systems. It is being developed as part of Google’s project Sparrow, whose charter is to build a low-power embedded platform for ML applications with a focus on security and privacy. CantripOS is built in the Rust programming language [1], runs under the seL4 microkernel [2], and uses a modified CAmkES framework [3]. This allows CantripOS to run dynamically loaded applications in a controlled sandbox, while still retaining the benefits of a statically designed system. This paper describes the system design, modifications made to seL4 and CAmkES, and future directions. All the work described here is publicly available on GitHub [4].
  </p>
  <ol>
    <li>https://www.rust-lang.org/</li>
    <li>https://sel4.systems/Info/Docs/seL4-manual-12.1.0.pdf</li>
    <li>https://docs.sel4.systems/projects/camkes/</li>
    <li>https://github.com/AmbiML/sparrow-manifest</li>
  </ol>
</div>

<div class="summit_div">
  <h3 id="summit-important-dates">
    Important Dates
  </h3>
  <ul>
    <li>Abstracts due: <s>10 April 2023</s> 24 April 2023</li>
    <li>Notification of decisions: <s>2 June 2023</s> 9 June 2023 </li>
    <li><strong>Early bird cut-off: 18 August 2023</strong></li>
    <li>Summit: 19-21 September 2023</li>
  </ul>
</div>

<div class="summit_div">
  <h3 id="summit-about">
    About
  </h3>
  <p>
    The seL4 Summit is the annual international summit on the <a href="../../../About">seL4 microkernel</a>, the world's most highly assured OS kernel, as well as on all seL4-related technology, tools, infrastructure, products, projects, and people.
  </p>
  <p>
    It aims to gather all the seL4 community to learn, share, and connect:
  </p>
    <ul>
      <li>learn about the seL4 technology, its latest progress, use, successes, challenges, plans;</li>
      <li>share exciting seL4 development, research, experience, application in the real world;</li>
      <li>connect with other seL4 developers, users, providers, customers, supporters, potential partners and enthusiasts.</li>
    </ul>
  <p>
    The seL4 Summit is organised by the <a href="../../../Foundation">seL4 Foundation</a>, in a location aimed to be on a different continent each year, as far as possible.
  </p>
  <p>
    An open call for presentations invites submissions of short abstracts about cool work on seL4, and a Program Committee made of a wide range of representatives of the seL4 community is in charge of the technical content (reviewing submission, selecting invited speakers, defining the program).
  </p>
</div>

<div class="summit_div">
  <h3 id="summit-registration">
    Registration
  </h3>
  <p>
   The seL4 summit will cover the complete seL4 ecosystem, consisting of the verified microkernel, as well as all seL4-related technology, tools, infrastructure, products, projects, and people.
  </p>
  <p>
    Tickets include:
  </p>
  <ul>
    <li>Participation in the 3-day conference, including talks, keynotes, seL4 updates & discussions</li>
    <li>Networking with other seL4 experts and enthusiasts</li>
    <li>Reception and Dinner</li>
  </ul>
  <p>
    <strong><a href="https://events.linuxfoundation.org/sel4-summit/">Hotel bookings and summit registration</a></strong>
  </p>
  <p>
    The early bird cut-off date is 18 August 2023.
  </p>
</div>

<div class="summit_div">
  <h3 id="summit-location">
    Location and Venue
  </h3>
  <p>
    The seL4 Summit 2023 will be held in Minneapolis, USA, 19 - 21 September 2023, at the Elliot Park Hotel. The summit will be hosted by the <a href="https://www.linuxfoundation.org/">Linux Foundation</a>, and will be an in-person event.
  </p>
  <p>
    <strong><a href="https://events.linuxfoundation.org/sel4-summit/">Hotel bookings and summit registration</a></strong>
  </p>
</div>

<div class="summit_div">
  <h3 id="summit-pc">
    Program committee
  </h3>
  <p>
<p>
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
      <a href="https://proofcraft.systems/#june"><img src="../../Board/TS-June-s.jpg" alt="June Andronick" width="80" /></a>
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
      <a href="https://trustworthy.systems/people/?cn=Gernot+Heiser"><img src="../../Board/TS-Gernot-s.jpg" alt="Gernot Heiser" width="80"/></a>
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






<div class="summit_div">
  <h3 id="summit-contact">
    Contact
  </h3>
  <p>
    For any questions regarding the summit, please contact <a title="summit@sel4.systems" href="mailto:summit@sel4.systems">summit@sel4.systems</a>.
  </p>
</div>



<!--
  <h3>
   Call for Presentations
  </h3>

  <p>

  Check the <a href="./cfp">CFP</a>.  To propose a talk, send an abstract of
  <strong>one page or less</strong> <strong>by Monday 9th of May 2022</strong>
  to <a title="summit@sel4.systems"
  href="mailto:summit@sel4.systems">summit@sel4.systems</a>.  If you would like
  to propose a talk to be delivered remotely, please notify it in the
  submission.

  </p>
-->