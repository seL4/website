<!--<title>News about seL4 and the seL4 Foundation</title>-->
<!--
    Copyright 2020 seL4 Project a Series of LF Projects, LLC.
    SPDX-License-Identifier: CC-BY-SA-4.0
-->
<h1>
  News about
  <a href="home.pml">seL4</a>
  and the
  <a href="/Foundation">seL4 Foundation</a>
</h1>





<!----------------------------------------------------------->

<!--
<div class="news-item">
  29 Jan 2021: Raytheon joins the seL4 Foundation
</div>
<div>
 <p>

   <img src="/Foundation/Membership/LOGOS/raytheontechnologies.svg"
   style="width: 20%;  padding-left:10px;  float:right"
   alt="Raytheon logo">

    blah blah blah blah blah blah blah blah blah blah blah blah blah
    blah blah blah blah blah blah blah blah blah blah blah blah blah
    blah blah blah blah blah blah blah blah blah blah blah blah blah
    blah blah blah blah blah blah blah blah blah blah blah blah blah
    blah blah blah blah blah blah blah blah blah blah blah blah blah
    blah blah blah blah blah blah blah
 </p>
</div>
-->

<div class="news-item">
  2 August 2021: Kansas State University joins seL4 Foundation
</div>
<div>
 <p>
   <img src="/Foundation/Membership/LOGOS/kansas-state.svg"
   style="width: 15%;  padding-left:10px;  float:right"
	alt="KSU logo">

   The seL4 Foundation is pleased to
   welcome <a href="https://www.k-state.edu/">Kansas State
   University</a> as Associate Member. KSU has for years been
   collaborating for years on seL4-based projects with a number of
   Foundation members under multiple DARPA projects and we are looking
   forward to their continued involvement.
 </p>
</div>

<!----------------------------------------------------------->

<div class="news-item">
  29 July 2021: Happy seL4 day!
</div>
<div>
 <p>
   <img src="/images/sel4-birthdaycake.png"
   style="width: 15%;  padding-left:10px;  float:right"
   alt="seL4 birthday cake">

   On 29th July 2009, the original functional correctness proof of seL4 was
   completed, a widely-recognised research breakthrough and the first big
   milestone in seL4's history.  We obviously had a party then, and have since
   celebrated its anniversary, calling it, tongue-in-cheek, “International Proof
   Day”.
 </p>
 <p>
   On the fifth anniversary we open-sourced seL4, which was another major
   milestone, which we referred to as “seL4 Freedom Day”.
 </p>
 <p>
   Today marks the 12th anniversary of the proof, and the 7th anniversary of
   open-sourcing, and from now on we’ll refer to the date simply as "seL4 Day”.
 </p>
 <p>
   The seL4 community is now definitely global. Still we would normally have a
   physical party in Sydney, but won’t be able to due to the renewed Covid-19
   restrictions – so we’ll all be remote ;-)
 </p>
 <div class="highlight">
  <img src="images/seL4.svg" style="width:15%; padding-left:1em;" alt="seL4"><p>
   Happy seL4 Day everyone!</p>
 </div>
 <p>
 A virtual toast to you all, and a big thank-you to
   all for your continued support!
 </p>
</div>
<!----------------------------------------------------------->

<div class="news-item">
  28 July 2021: Proof that seL4 enforces integrity established for RISC-V
</div>
<div>
 <p>
   <img src="/Foundation/Membership/LOGOS/RISC-V.svg"
   style="width: 20%;  padding-left:10px;  float:right"
	alt="RISC-V logo">

   The assurance story for <a href="https://sel4.systems">seL4</a>
   on <a href="https://riscv.org">RISC-V</a> keeps building. We first
   formally proved <em>functional
   correctness</em>: <a href="https://microkerneldude.wordpress.com/2020/06/09/sel4-is-verified-on-risc-v/">that
   the seL4 C code on RISC-V platforms behaves exactly as its
   specification says</a>. We then established <em>binary
   correctness</em>: <a href="https://microkerneldude.wordpress.com/2021/05/05/sel4-on-risc-v-verified-to-binary-code/">that
   the machine code running on the processor behaves exactly as the C
   code, and by extension, as the specification says</a>. We now have
   established the crucial <strong>integrity</strong> property for
   seL4 on RISC-V: that the specification, and by extension the kernel
   binary, prevents an application running on top from modifying data
   without authorisation. In seL4 speak: seL4 provably enforces
   capability-based access control.
 </p>

 <p>
   &ldquo;The integrity property is crucial for security: it is key to
   enforce the <strong>isolation</strong> of components running on top
   of the kernel&rdquo;, says Gerwin Klein, seL4 verification expert
   and chair of the seL4 Foundation technical steering
   committee. &ldquo;This is what allows critical components, like the
   network controller that has access to software-controlled brakes in
   a modern car, to securely run alongside untrusted software, like
   the entertainment system. With proved integrity, you know that an
   attack on or from a vulnerable untrusted part of the system cannot
   compromise the critical parts.&rdquo;
 </p>

   <img src="/images/arc-logo.svg"
   style="width: 20%;  padding-left:10px;  float:right"
	alt="ARC logo">

 <p>
   Integrity had been proved in the original seL4 verification on the
   Arm32 architecture. It is now also established for RISC-V
   architecture, making it the only 64-bit architecture with an OS
   with such a comprehensive verification and security story. We thank
   <a href="https://trustworthy.systems/people/?cn=Ryan+Barry">Ryan
   Barry</a> of Trustworthy Systems, main author of these proofs! We
   also gratefully acknowledge funding from the
   <a href="https://arc.gov.au">Australian Reseach Council</a> through grant
   DP190103743 which has enabled this work.
 </p>

 <p>
   <a href="https://github.com/seL4/l4v/tree/master/proof/access-control">The
   proof can be found on GitHub.</a>
 </p>
</div>

<!----------------------------------------------------------->

<div class="news-item">
  13 July 2021: TU Munich joins seL4 Foundation
</div>
<div>
 <p>
   <img src="/Foundation/Membership/LOGOS/TU-Munich.svg"
   style="width: 15%;  padding-left:10px;  float:right"
	alt="TU Munich logo">

   The seL4 Foundation is pleased to
   welcome <a href="https://www.tum.de/en">Technical University of Munich</a> as
   Associate Member. The TUM, home of the Isabelle theorem prover used
   in the verification of seL4, has been a collaborator of the
   Trustworthy Systems team for many years.
 </p>
</div>

<!----------------------------------------------------------->

<div class="news-item">
  8 July 2021: Second State joins the seL4 Foundation
</div>
<div>
 <p>

   <img src="/Foundation/Membership/LOGOS/secondstate.svg"
   style="width: 15%;  padding-left:10px;  float:right"
   alt="Xcalibyte logo">

   The seL4 Foundation
   welcomes <a href="https://secondstate.io">Second State</a> as a member.
 </p>

 <p>
   Second State is the creator and maintainer of WasmEdge, a CNCF /
   Linux Foundation project, which provides a high-performance,
   lightweight, cross-platform, polyglot, and secure software
   runtime/sandbox for edge computing. Based on the WebAssembly
   standard, WasmEdge could be 100 times faster than Docker and hypervisor-based
   solutions. It supports multiple programming languages, including
   DSLs, and can be embedded into multiple hosting environments.
 </p>

 <p>
   Second State is currently porting WasmEdge to seL4. It will be one of the
   first software runtimes in the seL4 ecosystem. By working with
   members in the seL4 Foundation, Second State aims to create a
   real-time software sandbox for automotive and industrial (ie smart
   factories) applications.
 </p>
</div>

<!----------------------------------------------------------->

<div class="news-item">
  7 July 2021: Welcome new Board Members
</div>
<div>
  <p>
    With four new Premium Members joining the seL4 Foundation during
    the past few weeks, we now welcome their representatives on the
    seL4 Board. The new Board Members are:
  </p>

  <table>
    <tr>
      <td>
	<a href="Foundation/Board/Horizon-Feng.jpg"><img
						      src="Foundation/Board/Horizon-Feng-s.jpg"
					alt="Dr Feng Zhou" width="80"
						      /></a>
	&nbsp; &nbsp;
      </td>
      <td>
	Dr. Feng Zhou represents <a href="https://horizon.ai/">Horizon
	  Robotics</a>, where he is a Fellow. He has 15 years of academic
	as well as 15 years of industry experience in video/image
	compression &amp; processing, computer vision, artificial
	intelligence, and ASIC processor architecture.
      </td>
    </tr>

    <tr>
      <td>
	<a href="Foundation/Board/Li-Ian.png"><img
					src="Foundation/Board/Li-Ian-s.png"
					alt="Ian Xu" width="80" /></a>
	&nbsp; &nbsp;
      </td>
      <td>
	Ian Xu represents <a href="https://lixiang.com/">Li Auto</a>,
	where he serves as Vice President, leading Computing
	Platform design and development including hardware, OS and
	run-time environment. His experience is in the design and
	development of networking and wireless communication products.
      </td>
    </tr>

    <tr>
      <td>
	<a href="Foundation/Board/Jump-Matt.jpg"><img
					src="Foundation/Board/Jump-Matt-s.jpg"
					alt="Dr Matthew P. Grosvenor"
					width="80" /></a>
	&nbsp; &nbsp;
      </td>
      <td>
	Dr Matthew P. Grosvenor
	represents <a href="https://jumptrading.com/">Jump Trading</a>,
	where he specializes on measurement and optimization of
	high-performance and low-latency network systems. Matthew is a
	former member of the Trustworthy Systems research group that
	developed seL4.
      </td>
    </tr>

    <tr>
      <td>
	<a href="Foundation/Board/NIO-Qiyan.png"><img
						   src="Foundation/Board/NIO-Qiyan-s.png"
						   alt="Qiyan Wang"
						   width="80" /></a>
      </td>
      <td>
	Qiyan Wang represents <a href="https://nio.com/">NIO</a>, where he
	leads a global R&amp;D team responsible for Vehicle Operating
	System, Connected Vehicle Cloud, Vehicle Digital Architecture,
	Cyber Security, and Vehicle Software Integration and
	Validation.
	&nbsp; &nbsp;
      </td>
    </tr>
  </table>

  <p>
    The four new members join five continuing members on
    the <a href="Foundation/Board/">seL4 Board</a>, taking the size of
    the Board to nine.
  </p>
</div>

<!----------------------------------------------------------->

<div class="news-item">
  29 July 2021: Jump Trading joins the seL4 Foundation
</div>
<div>
 <p>

   <img src="/Foundation/Membership/LOGOS/Jump-Trading.svg"
   style="width: 20%;  padding-left:10px;  float:right"
   alt="Jump Trading logo">

   The seL4 Foundation welcomes <a href="https://jumptrading.com/">Jump
   Trading</a> as a Premium Member.
 </p>

 <p>
    Jump is a research-based organization that is committed to
    applying cutting edge technology to trading global financial
    markets. Jump has the full spectrum of technology challenges from
    machine learning models and HPC at massive scale to cybersecurity
    and trusted compute requirements that come from being a major
    market participant in many asset classes. Jump was founded in 1999
    and has over 20 global offices including Sydney, Shanghai and
    Singapore in Asia.
 </p>
</div>

<!----------------------------------------------------------->

<div class="news-item">
  23 Jun 2021: Horizon Robotics joins the seL4 Foundation
</div>
<div>
 <p>

   <img src="/Foundation/Membership/LOGOS/Horizon_Robotics.svg"
   style="width: 25%;  padding-left:10px;  float:right"
   alt="Horizon Robotics logo">

   The seL4 Foundation welcomes <a href="https://horizon.ai">Horizon
   Robotics</a> as a Premium Member.
 </p>

 <p>
   Horizon Robotics is a global leader in the development of
   artificial intelligence computing platforms. Its mission is to make
   driving safer and more convenient as drivers transition to
   intelligent and self-driving vehicles. Founded in Beijing in 2015,
   Horizon Robotics develops next-generation autonomous driving
   technology integrating edge-AI processors, algorithms, and
   toolkits. Horizon has reinvented the automotive-grade AI processor
   with Horizon Journey SOC and its Brain Processing Unit AI engine
   (Horizon BPU), to offer the ultimate balance of high-performance,
   low power, and cost effectiveness for inference at the
   edge. Horizon's state-of-the-art AI toolkit and model zoo enable
   developers to optimize and deploy their own neural network models
   to Journey BPU with ease. Horizon also offers vision perception
   algorithms to accelerate time-to-production in the dynamic and
   highly competitive ADAS/AD market.
 </p>

 <p>
   The evolution of automotive E/E architecture continues
   rapidly. With complicated hardware consolidation, software
   consolidation and separation happen simultaneously. &ldquo;To address the
   challenges of safety, security and realtime in autonomous software,
   a fundamental high quality state-of-the-art microkernel is
   needed. We are looking forward to working with members of seL4
   Foundation to build mixed-critical platform and solution for
   next-generation autonomous driving vehicles.&rdquo;
 </p>
</div>

<!----------------------------------------------------------->

<div class="news-item">
  23 June 2021: Li Auto joins the seL4 Foundation
</div>
<div>
 <p>

   <img src="/Foundation/Membership/LOGOS/Li_Auto.svg"
   style="width: 20%;  padding-left:10px;  float:right"
   alt="Li Auto logo">

   The seL4 Foundation
   welcomes <a href="https://lixiang.com">Li Auto Inc.</a>&nbsp;as a Premium Member.
 </p>

 <p>
   Li Auto is an innovator in China's new energy vehicle market. The
   Company designs, develops, manufactures, and sells premium smart
   electric vehicles. Through innovations in product, technology, and
   business model, the Company provides families with safe, convenient,
   and refined products and services. Li Auto is a pioneer to
   successfully commercialize extended-range electric vehicles in
   China. Its first model, Li ONE, is a six-seat, large premium electric
   SUV equipped with a range extension system and advanced smart vehicle
   solutions. The Company started volume production of Li ONE in
   November 2019 and released the 2021 Li ONE in May 2021. The Company
   leverages technology to create value for its users. It concentrates
   its in-house development efforts on its proprietary range extension
   system, next-generation electric vehicle technology, and smart
   vehicle solutions. Beyond Li ONE, the Company aims to expand its
   product line by developing new vehicles, including BEVs and EREVs, to
   target a broader consumer base.
 </p>

 <p>
   Li Auto's team will develop a secure highly extensible real-time open
   platform for next generation self-driving vehicles based on the
   micro-kernel OS seL4. The platform will enable an ecosystem for
   third party application developers.
 </p>
</div>

<!----------------------------------------------------------->

<div class="news-item">
  22 June 2021: Xcalibyte joins the seL4 Foundation
</div>
<div>
 <p>

   <img src="/Foundation/Membership/LOGOS/xcalibyte.svg"
   style="width: 15%;  padding-left:10px;  float:right"
   alt="Xcalibyte logo">

   The seL4 Foundation
   welcomes <a href="https://xcalibyte.com">Xcalibyte</a> as a member.
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

 <p>
   &ldquo;As we are actively working with members of the seL4
   Foundation, it makes perfect sense for us to be part of the
   organisation. Our code analysis tools are being used by community
   members and we are aiming to ensure they develop high quality and
   secure code.&rdquo;
 </p>
</div>

<!----------------------------------------------------------->

<div class="news-item">
  18 Jun 2021: NIO joins the seL4 Foundation
</div>
<div>
 <p>

   <img src="/Foundation/Membership/LOGOS/NIO.png"
   style="width: 15%;  padding-left:10px;  float:right"
   alt="NIO logo">

   The seL4 Foundation
   welcomes <a href="https://nio.com">NIO Inc</a> as a Premium member.
 </p>

 <p>
   NIO is a pioneer in China's premium electric vehicle
   market. We design, jointly manufacture, and sell smart and
   connected premium electric vehicles, driving innovations in next
   generation technologies in connectivity, autonomous driving, and
   artificial intelligence. Redefining user experience, we provide
   users with comprehensive, convenient, and innovative charging
   solutions and other user-centric service offerings. NIO went public
   in the U.S. in 2018. So far, NIO has launched 3 mass-production vehicle
   models: ES8, ES6, and EC6, and accumulated deliveries to users are
   over 120,000. Starting September, NIO will start delivering to
   users in Norway. NIO invests heavily in in-house R&amp;D to build
   full-stack cutting-edge technologies around intelligent and
   autonomous driving EV. Its engineering teams are distributed across
   the globe, including US, UK, Germany and China.
 </p>

 <p>
   The Digital Systems department at NIO is missioned to develop the
   most advanced software platform for the next-generation autonomous
   driving vehicles in the industry from the ground up. This platform
   is internally named NIO Vehicle Operating System (NVOS) and based
   off seL4. It involves solving a wide range of technical challenges,
   such as seamless app development on heterogeneous hardware
   chipsets, low-latency & high throughput data processing, powerful
   AI framework, automobile-grade safety and security guarantee, and
   complete toolchains to provide Android alike development
   experience.
 </p>
</div>

<!----------------------------------------------------------->

<div class="news-item">
  11 June 2021: seL4 12.1.0 released
</div>
<div>
 <p>
    <img src="images/seL4.svg" style="width:15%; padding-left:1em; float:right" alt="seL4">

    The seL4 Foundation has released the following updates:
 </p>
 <ul>
   <li>
     seL4 v12.1.0:
     <a href="https://github.com/seL4/seL4/releases/tag/12.1.0">release</a>,
     <a href="https://docs.sel4.systems/releases/sel4/12.1.0">change log</a>
   </li>
   <li>
     CAmkES v3.10.0:
     <a href="https://github.com/seL4/camkes-tool/releases/tag/camkes-3.10.0">release</a>,
     <a href="https://docs.sel4.systems/releases/camkes/camkes-3.10.0">change log</a>
   </li>
   <li>
     CapDL v0.2.1:
     <a href="https://github.com/seL4/capdl/releases/tag/0.2.1">release</a>,
     <a href="https://docs.sel4.systems/releases/capdl/0.2.1">change log</a>
   </li>
 </ul>

 <p>
   Various repositories with support libraries and tools have also been updated.
   Please refer to the following release manifests:
 </p>

 <ul>
   <li>
     <a href="https://github.com/seL4/sel4test-manifest/releases/tag/12.1.0">seL4 Test</a>
   </li>
   <li>
     <a href="https://github.com/seL4/sel4-tutorials-manifest/releases/tag/camkes-3.10.0">seL4 Tutorials</a>
   </li>
   <li>
     <a href="https://github.com/seL4/camkes-manifest/releases/tag/camkes-3.10.0">CAmkES</a>
   </li>
 </ul>
</div>

<!----------------------------------------------------------->

<div class="news-item">
  9 June 2021: seL4 Foundation appoints CEO
</div>
<div>
 <p>


    <img src="/Foundation/Board/TS-June-s.jpg" alt="June Andronick" width="80"
	 style="padding-left:10px;  float:right" />

    The seL4 Foundation has appointed Dr June Andronick as (part time)
    CEO. June, already a permanent board member as one of the founders
    of the seL4 technology, continues to fullfil the role of
    Treasurer.
 </p>
</div>

<!----------------------------------------------------------->

<div class="news-item">
  7 June 2021: Kry10 the seL4 Foundation
</div>
<div>
 <p>
   <img src="/Foundation/Membership/LOGOS/Kry10.svg"
   style="width: 15%;  padding-left:10px;  float:right"
   alt="Kry10 logo">

   The seL4 Foundation welcomes New-Zealand
   based <a href="https://kry10.com/">Kry10</a> as our latest member.
 </p>
 <p>
   &ldquo;We believe that formal methods and proven code is the only
   viable option for software, whether it is AI, Industrial controls,
   or really anything else. seL4 is the first, and only real practical
   kernel to show the world how it should be done,&rdquo; says Boyd
   Multerer, CEO and Founder of Kry10.
 </p>

 <p>
   &ldquo;At Kry10, we are building a full-featured operating system
   on top of the seL4 Kernel, along with tooling, services, key
   management and more. We are aiming at industrial use, but it is
   suitable for consumer devices and more. Combined with the Erlang
   BEAM VM for applications, we intend to deliver systems with great
   security and minimal downtime, even across upgrades.&rdquo;
 </p>
</div>

<!----------------------------------------------------------->
<div class="news-item">
  24 May 2021: 4 concrete ways to support seL4 now
</div>
<div>
  <p>
    <img src="/images/sel4-foundation-logo.svg" style="width: 15%;
    padding-left:10px; float:right" alt="RISC-V logo">
  </p>
  <p>
    It has been heart-warming to see the response of the seL4
    community to the news of the dismantlement of the Trustworthy
    Systems group (TS), creator of seL4.
  </p>

  <p>
    The seL4 Foundation, as well as its members and ecosystem, want to
    reinforce their commitment to the success and support of seL4. The
    TS team will be rebuilding at UNSW and a number of
    Foundation-endorsed <a href="/Foundation/Services">seL4 services
    providers</a> as well as the newly created <a
    href="https://proofcraft.systems">Proofcraft</a> verification
    company are dedicated to support seL4 in the future.
  </p>
  <p>

    With this recent news, it’s never been more important to work
    together as a community to support seL4 and the transition of the
    support and development to the Foundation and its members. People
    have been asking how to help. Offers of support keep coming. We
    are looking at various options for sustainable support, with a
    priority of keeping the team together. There are options on the
    table that we are exploring that may allow us to do that. Please
    help us with that, the existing TS team is the best base for
    stable seL4 support.
  </p>
  <p>
    <b> In the meantime, here are 4 concrete things that can be done
    now. Spread the word to people who care about seL4’s future, and
    <a href="mailto:foundation@sel4.systems">contact us</a> if you
    want to discuss.</b>
  </p>
  <ol>
    <li>

      <b> donations and crowdfunding, in particular towards the
	  “continuity project".</b><br>

      <a
      href="/Foundation/Support">https://sel4.systems/Foundation/Support/</a><br>
      <a
      href="https://crowdfunding.lfx.linuxfoundation.org/projects/e94c998c-bac2-4224-b0ae-23f265fdd1a5">seL4 crowdfunding page</a><br>

      The crowd-funding platform works for large and small financial
      contributions, and contributions can be dedicated to specific
      topics. Fans are always welcome to contribute and show the
      continued support to seL4 :), but if you know of companies that
      would like to show financial support without a longer-term
      commitment, this is a quick and easy mechanism to do so.<br>
      We have set up a dedicated “continuity project” to raise funds
      specifically targeted to the transition of the infrastructure
      (testing, boards etc) and the immediate support needs (maintenance
      of all configurations, libraries, releases etc) to the
      Foundation. All donors of $1,000 and above will be listed on the
      page above.

    </li>
    <li>

      <b> get more members signed up to the Foundation.</b><br>

      <a
      href="/Foundation/Join">https://sel4.systems/Foundation/Join/</a><br>

      A push to get more organisations joining in the coming weeks
      will be a clear message of the strong support to seL4 and will
      provide the necessary funds funds to transition more support to
      the Foundation. Longer term, membership helps deliver on the
      Foundation’s vision to increase usability, exposure, support,
      education, participation, and verification of seL4. Join or help
      spreading the word to join to your partners and customers.

    </li>
    <li>

      <b> in-kind offer of expertise.</b><br>

      The number of seL4 experts is growing. Active participation and
      especially support for new users and beginners on Discourse
      (https://sel4.discourse.group) and the mailing list will help
      keep the community active. Likewise contributions to reviews and
      discussion on GitHub on pull requests and issues will help to
      keep things moving. The focus has shifted away from just D61
      contributions in the past year already, now is the time to keep
      the momentum up. The TS team and people in the technical
      steering committee are working on moving testing and
      verification infrastructure to UNSW. This will include opening
      up the infrastructure such that members can contribute hardware
      tests. We will send more information about this in the next few
      weeks. Please contact Gerwin as the TSC chair if you are
      interested in this or have additional ideas how to help.<br>

      We were gearing up for the next seL4 release. This might be
      slightly delayed by the infrastructure move, but if everything
      comes together as planned the release will go ahead.

    </li>
    <li>

      <b>jobs in the seL4 ecosystem.</b><br>

      <a href="/Foundation/Jobs">
      https://sel4.systems/Foundation/Jobs/</a><br>

      While some expertise is needed to be kept within the Foundation,
      it is also important to keep it within the community. We have
      just set up a page for members to post jobs related to
      seL4. This will help match seL4 experts to organisations willing
      to build upon, develop or support seL4. Contact
      foundation@sel4.systems to post on that page.

    </li>
  </ol>

</div>


<!----------------------------------------------------------->
<div class="news-item">
  23 May 2021: New "Jobs" page on the seL4 Foundation website
</div>
<div>
 <p>
   <img src="/images/sel4-foundation-logo.svg"
   style="width: 15%;  padding-left:10px;  float:right"
	alt="RISC-V logo">

   The community has expressed a need to more easily find seL4 experts
   to hire. The Foundations has created a <a
   href="/Foundation/Jobs">"Jobs in seL4 ecosystem" page</a> where
   members can post offers for positions with seL4 expertise.

 </p>
</div>

<!----------------------------------------------------------->
<div class="news-item">
  5 May 2021: RISC-V International and seL4 Foundation Announce New Security Milestone
</div>
<div>
 <p>
   <img src="/Foundation/Membership/LOGOS/RISC-V.svg"
   style="width: 15%;  padding-left:10px;  float:right"
	alt="RISC-V logo">

   Today, the <a href="/Foundation/">seL4 Foundation</a> and
   <a href="https://riscv.org">RISC-V International</a> announced that the
   verified seL4 microkernel on the RV64 architecture has been proved
   down to the executable code
   by <a href="https://data61.csiro.au">CSIRO’s Data61</a>, thanks to
   funding provided by <a href="https://hensoldt-cyber.com">HENSOLDT
   Cyber GmbH</a>. This guarantees that the seL4 microkernel on RV64
   will operate to specification even when built with an untrusted C
   compiler, GCC.
 </p>

 <p>
   Within and across open collaboration communities it is essential to
   work together on areas of mutual interest. RISC-V and seL4 are
   pleased to announce their progress and their alliances as they join
   forces to enable stronger overall security, combining
   security-oriented architecture and operating system design.
 </p>

 <p>
   &ldquo;We are excited to be one of the first architectures with
   secure operating system kernels with such a strong formal
   verification story,&rdquo; said Mark Himelstein, CTO of RISC-V
   International. &ldquo;RISC-V is continuing to increase the security
   features that encompass the ISA and the secure seL4 kernel is a
   natural complement.&rdquo;
 </p>

 <p>
   &ldquo;This is another milestone for seL4, which continues to
   define the state of the art in OS security,&rdquo; added Prof
   Gernot Heiser, Chairman of the seL4 Foundation. &ldquo;Stronger
   aligning the two open ecosystems makes a lot of sense.&rdquo;
 </p>

 <p>
   &ldquo;The verified seL4 microkernel forms the core of TRENTOS, our
   secure operating system for our MiG-V chip, a RISC-V processor with
   supply chain security&rdquo;, said Sascha Kegrei&szlig;&rdquo;, CTO
   of HENSOLDT Cyber GmbH. &ldquo;This unique combination of hardware
   and software security can protect critical assets from advanced
   persistent cyber threats.&rdquo;
 </p>

 <p>
   &rdquo;Translation validation ties all of our verification efforts
   together,&rdquo; said Dr Zoltan Kocsis, CSIRO Verification
   Engineer. &ldquo;Bringing translation validation to a modern,
   64-bit processor presented significant scalability challenges but,
   in the end, we were able to overcome them.&rdquo;
 </p>

 <p>
   For more details on binary verification of seL4 on RISC-V
   see Gernot's
   blog: <a href="https://microkerneldude.wordpress.com/2021/05/05/sel4-on-risc-v-verified-to-binary-code/">seL4 on
   RISC-V Verified to Binary Code (and seL4 and RISC-V Foundations
   form an alliance)</a>.
 </p>
</div>
<!----------------------------------------------------------->

<div class="news-item">
  23 April 2021: ETH Zurich joins seL4 Foundation
</div>
<div>
 <p>
   <img src="/Foundation/Membership/LOGOS/ETH-Zurich.svg"
   style="width: 15%;  padding-left:10px;  float:right"
	alt="ETH Zurich logo">

   The seL4 Foundation is pleased to
   welcome <a href="https://ethz.ch/en.html">ETH Zurich</a> as
   associate member, and is looking forward to further strengthening
   of ETH's engagement with seL4.
 </p>
</div>
<!----------------------------------------------------------->
<div class="news-item">
  15 April 2021: seL4 Foundation sets up crowdfunding portal
</div>
<div>
 <p>
   The seL4 Foundation now has an easy way for the general public to
   support financially the development of seL4 and its open-source
   ecosystem, using the Linux
   Foundation's <a href="https://crowdfunding.lfx.linuxfoundation.org/projects/e94c998c-bac2-4224-b0ae-23f265fdd1a5">LFX portal</a>.
 </p>
</div>
<!----------------------------------------------------------->
<div class="news-item">
  4 Mar 2021: Raytheon joins the seL4 Foundation
</div>
<div>
 <p>
   <img src="/Foundation/Membership/LOGOS/raytheontechnologies.svg"
   style="width: 15%;  padding-left:10px;  float:right"
	alt="Raytheon logo">

   The seL4 Foundation
   welcomes <a href="https://www.rtx.com/">Raytheon
   Technologies</a> as our latest member.
 </p>
 <p>
   Members of the Raytheon Technologies team have been long-time core
   participants in the seL4 ecosystem, predating the company’s
   formation in 2020, which brought together Raytheon Company and
   United Technologies’ aerospace businesses, Collins Aerospace and
   Pratt &amp; Whitney. Collins Aerospace was a prime contractor in the
   DARPA HACMS program, which demonstrated the seL4-based incremental
   cyber retrofit of autonomous military vehicles. This was a major
   milestone in the growth of seL4, demonstrating that it protects
   against cyber attacks on real systems in operation. The same
   Raytheon Technologies team now leads the follow-on DARPA CASE
   program, aiming at designed-in cyber-resiliency, including the
   seL4-based framework for verified initialisation and configuration
   of systems architectures.
 </p>
</div>
<!----------------------------------------------------------->
<div class="news-item">
  19 Feb 2021: HENSOLDT Cyber receives interim endorsement
</div>
<div>
 <p>

   <a href="http://hensoldt-cyber.com/">
   <img src="/Foundation/Membership/LOGOS/HENSOLDT_Cyber.svg"
    style="width: 15%;  padding-left:10px;  float:right"
    alt="HENSOLDT Cyber">
   </a>

   The seL4 Foundation has extended <a
   href="/Foundation/Services/">Interim Endorsement</a> as Trusted
   Service Provider to <a href="http://hensoldt-cyber.com/">HENSOLDT
   Cyber</a>, for consulting and development services for seL4-based
   systems. More on:
</p>

   <ul>
   <li>
   <a href="/Foundation/Services/hc.pml">HENSOLDT Cyber services
   and products</a>;
   </li>
   <li>
   <a href="/Foundation/Services/endorsement.pml">the seL4
   Foundation’s Interim Endorsement program</a>.
   </li>
   </ul>
</div>
<!----------------------------------------------------------->

<div class="news-item">
  11 Feb 2021: seL4 Foundation endorses service providers
</div>
<div>
 <p>
 The seL4 Foundation has commenced providing interim endorsement for
 <strong>trusted service providers</strong> for seL4. These may apply
 to consulting and development services as well as for training. In a
 first step, the Foundation has given interim endorsement to the
 following trusted service providers (in the order of approval):
</p>
 <ul>
 <li>
   <a href="https://dornerworks.com/">DornerWorks Ltd</a>
 </li>
 <li>
 <a href="https://brkawy.com/">Breakaway Consulting Pty Ltd</a>
 </li>
 <li>
 <a href="https://cog.systems/">Cog Systems Inc</a>
 </li>
 </ul>

 <p>
 Interim endorsement is intended to lead to full certification; the
 Foundation will work with interim endorsees and the general
 membership on developing certification schemes. <a
 href="/Foundation/Services/">More detail</a>.
 </p>

 <p>
   <a href="https://dornerworks.com/">
   <img src="/Foundation/Membership/LOGOS/DornerWorks.svg"
   style="width:15%; padding-left:1em"
   alt="DornerWorks logo">
   </a>
   <a href="https://brkawy.com/">
   <img src="/Foundation/Membership/LOGOS/Brkawy.png"
   style="width:15%; padding-left:1em"
   alt="Breakaway Consulting logo">
   </a>
   <a href="https://cog.systems/">
   <img src="/Foundation/Membership/LOGOS/Cog.jpg"
   style="width:15%; padding-left:1em"
   alt="Cog logo">
   </a>
</p>
</div>
<!----------------------------------------------------------->

<div class="news-item">
  8 Feb 2021: Penten joins the seL4 Foundation
</div>
<div>
 <p>
    The seL4 Foundation welcomes <a href="https://www.penten.com">Penten Pty Ltd</a> as our newest member. Penten is based in Canberra, Australia, and specialises in secure communications technology and artificial intelligence. Penten has been developing seL4-based products for a number of years, some of which are in daily use in multiple defence forces.
 </p>
</div>

<!----------------------------------------------------------->
<div class="news-item">
 31 Dec 2020: seL4 YouTube Channel
</div>
<div>
 <p>

  There is now a <a
  href="https://www.youtube.com/channel/UCIqVY1XFPOPIZ1z2A9TrmMA/about">YouTube
  channel</a> run by the seL4 Foundation. It presently has two
  playlists, one with the recordings of the seL4 material from this
  year’s UNSW Advanced Operating Systems course, and one with seL4
  Summit talks from Trustworthy Systems.

  More to come, enjoy.

 </p>
</div>


<!----------------------------------------------------------->
<div class="news-item">
 9 Nov 2020: seL4 12.0.0 release
</div>
<div>
 <p>


   <img src="/images/seL4.svg"
   style="width:30%; padding-left:1em; float:right"
   alt="seL4">



  Announcing the releases of seL4, CAmkES and CapDL under the seL4
  Foundation.  Below you can find links to release notes with updates
  to other supporting projects to come before the end of the year.

  Versioned Releases:</p>
  <ul>
  <li>
  seL4 12.0.0 ~ <a href="https://docs.sel4.systems/releases/sel4/12.0.0">https://docs.sel4.systems/releases/sel4/12.0.0</a>
  </li>
  <li>
  CAmkES 3.9.0 ~ <a href="https://docs.sel4.systems/releases/camkes/camkes-3.9.0">https://docs.sel4.systems/releases/camkes/camkes-3.9.0</a>
  </li>
  <li>
  CapDL 0.2.0 ~ <a href="https://docs.sel4.systems/releases/capdl/0.2.0">https://docs.sel4.systems/releases/capdl/0.2.0</a>
  </li>
  </ul>



</div>

<!----------------------------------------------------------->
<div class="news-item">
 15 Oct 2020: 3rd seL4 summit to take place on 15-18 Nov
</div>
<div>
 <p>

  The <a href="http://www.sel4-us.org/summits/2020-summit/">3rd seL4
  Summit</a> will take place (virtually) on 15–18 November (US East
  Coast time).  The program features a tutorial and 3 days packed with
  great talks and panels.

  Presentations will be streamed according to the schedule and
  available for download right after, and there will be an on-line
  discussion forum.

  Registration is only $80US


 </p>
</div>

<!----------------------------------------------------------->
<div class="news-item">
 22 Jul 2020: Adventium Labs joins the seL4 Foundation!
</div>
<div>
 <p>

   <a href="https://www.adventiumlabs.com">
   <img src="/Foundation/Membership/LOGOS/adventium-labs.svg"
   style="width:40%; padding-left:1em; float:right"
   alt="Adventium Labs logo">
   </a>

  We’re happy to announce the newest member of the seL4 Foundation:
  Minneapolis-based company <a
  href="https://www.adventiumlabs.com">Adventium Labs</a>.

  Adventium Labs develops solutions for safe and secure
  software-intensive complex systems, with specialties in separation
  architectures, model-based system engineering, and mathematical
  analysis technologies. They are leveraging these capabilities to
  extend seL4 into safety and security critical industries, including
  medical devices, defense and commercial avionics, and industrial
  control.


 </p>
</div>

<!----------------------------------------------------------->
<div class="news-item">
  9 Jun 2020: functional correctness proof of seL4 RISC-V
</div>
<div>
 <p>

RISC-V (RV64) is the third ISA with verified seL4. The functional
correctness proof of seL4 on the RV64 ISA has
completed. Congratulations to the awesome Proof Engineering Team of
the Trustworthy Systems group on achieving this major milestone for
seL4! And many thanks to HENSOLDT Cyber for making it possible.

What we have now is the refinement proof from the seL4 formal spec to the C
implementation, putting RV64 on the same level as x64 in terms of seL4 verification. The
binary verification, which extends this refinement to the binary code of the kernel is
progressing, stay tuned for more news on that in the foreseeable future.

More on this in this <a
href="https://microkerneldude.wordpress.com/2020/06/09/sel4-is-verified-on-risc-v/">blog
post</a>.

 </p>
</div>



<!----------------------------------------------------------->
<div class="news-item">
  2 Jun 2020: UNSW seL4 teaching videos available
</div>
<div>
 <p>

  Yet another contribution of UNSW Sydney to the seL4 community: This
  year Gernot Heiser is making the seL4-related videos from his UNSW
  Advanced Operating Systems class freely available. You’ll find them
  at the <a
  href="https://www.youtube.com/playlist?list=PLbSaCpDlfd6qLbEsKquVo3--0gwYBmrUV">UNSW
  CSeLearning COMP9242 YouTube channel</a>.

  At present there are the first two modules, which provide some
  background on microkernels and seL4, and discuss the seL4 API. More
  material will show up over the next two months.

  The complete course material, including all lecture slides, the
  project spec and code, are available, as always, from the <a
  href="https://www.cse.unsw.edu.au/~cs9242/current/">COMP9042 web
  site</a>.

 </p>
</div>

<!----------------------------------------------------------->
<div class="news-item">
  25 May 2020: seL4 Foundation whitepaper released
</div>
<div>
 <p>

   <a href="/About/seL4-whitepaper.pdf">
   <img src="About/whitepaper.svg"
   style="width:15%; padding-left:1em; padding-bottom:1em; float:right"
   alt="seL4 Whitepaper">
   </a>


   The whitepaper "The seL4 Microkernel – An Introduction" provides an
   introduction to and overview of seL4. We explain what seL4 is (and
   is not) and explore its defining features. We explain what makes
   seL4 uniquely qualified as the operating-system kernel of choice
   for security- and safety- critical systems, and generally embedded
   and cyber-physical systems. In particular, we explain seL4’s
   assurance story, its security- and safety-relevant features, and
   its benchmark-setting performance. We also discuss typical usage
   scenarios, including incremental cyber retrofit of legacy systems.

   You can download <a href="https://sel4.systems/About/">here</a>.

</p>
</div>

<!----------------------------------------------------------->
<div class="news-item">
  9 Jun 2020: Breakaway Consulting joins the seL4 Foundation!
</div>
<div>
 <p>

   <a href="https://brkawy.com">
   <img src="/Foundation/Membership/LOGOS/Brkawy.png"
   style="width:40%; padding-left:1em; float:right"
   alt="Breakaway logo">
   </a>


   We’re happy to announce the first new member since the launch of
   the seL4 Foundation: Sydney-based company <a
   href="https://brkawy.com">Breakaway Consulting</a>.

   Through Founder and Managing Director Ben Leslie, Breakaway comes
   with 20 years of experience in L4 microkernels and systems based on
   various L4 kernels. Prior to founding Breakaway, Ben was a student
   with what is now the TS Group, and then VP Engineering of Open
   Kernel Labs.

   Breakaway offers consulting services on architecture, design and
   implementation of seL4-based systems.

</p>
</div>





<!----------------------------------------------------------->

<div class="news-item">
  7 Apr 2020: Launch of the seL4 Foundation
</div>

<div>
  <p>

   <img src="/images/mosaic.jpg"
   style="width:30%; padding-left:1em; float:right"
   alt="seL4 foundation launch" />

   The <a href="https://trustworthy.systems">Trustworthy Systems
   group</a> is excited to announce the creation of the <a
   href="/Foundation/">seL4 Foundation</a>. Its aim is to provide a
   neutral and independent organisation to ensure the longevity of
   seL4, and grow its ecosystem of adopters and contributors.

   It has a <a href="/Foundation/Board/">high-profile Board</a>
   consisting of Gernot Heiser (Chair), June Andronick, Gerwin Klein,
   John Launchbury, Sascha Kegreiß, Daniel Potts.

   It already has a number of members, including major adopters
   HENSOLDT Cyber and Ghost Systems, and providers of services for
   seL4, Cog Systems and DornerWorks. Please check the <a
   href="/Foundation/Membership/">membership page</a> for details and
   how to join.

   The seL4 Foundation is set up under the Linux Foundation, which
   provides a mature and well-known framework.
  </p>

  <p>

   More information on the <a
   href="https://microkerneldude.wordpress.com/2020/04/07/the-sel4-foundation-what-and-why/">Blog
   post</a> about "The seL4 Foundation &mdash; What and Why", and in
   the press releases from <a
   href="https://www.linuxfoundation.org/press-release/2020/04/sel4-microkernel-optimized-for-security-gets-support-of-linux-foundation/">the
   Linux Foundation</a> and from <a
   href="https://www.csiro.au/en/News/News-releases/2020/seL4-developers-create-open-source-foundation">CSIRO's
   Data61</a>.
  </p>
</div>



<div class="news-finish">
</div>
