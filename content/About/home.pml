<!--<title>About seL4</title> -->
<!--
    Copyright 2020 seL4 Project a Series of LF Projects, LLC.
    SPDX-License-Identifier: CC-BY-SA-4.0
-->
<h1>
  About seL4
</h1>
<a href="seL4-whitepaper.pdf">
<div class="col-sm pull-left"
     style="width: 15%;">
  <div class="row">
    <img style=
    "width: 75%; margin-top: 20px; vertical-align: top; float: left; margin: 10px;"
         src="whitepaper.svg"
         alt="seL4 Whitepaper">
  </div>
  <div class="row">
    Download Whitepaper
  </div>
</div>
</a>
<p>
  seL4 is a high-assurance, high-performance operating system
  microkernel. It is unique because of its comprehensive formal
  verification, without compromising <a href=
  "Performance/">performance</a>. It is meant to be used as a
  trustworthy foundation for building safety- and security-critical
  systems. It is available as open source on <a href=
  "https://github.com/seL4/">GitHub</a> and supported by the
  <a href="../Foundation/">seL4 Foundation</a>.
</p>
<p>
  <img style="width: 250px; margin-left: 10px; float: right;"
     src="../images/trusted.svg"
     alt="seL4 system" />
     Being a <em>kernel</em> means it is the piece
     of software that runs at the heart of any software system and
     controls all accesses to resources. It provides fine-grained
     access control through <a href=
     "https://en.wikipedia.org/wiki/Capability-based_security">capabilities</a>,
     and controls communication between components of the system.
     It is the most critical part of the software system, and runs
     in privileged mode.
</p>
<p>
  Being a microkernel means that it is reduced to a minimal core
  that is free from policy and therefore can form a dependable base
  for building arbitrary systems serving many different usage
  scenarios.
</p>
<p>
  seL4 is a member of the <a title=
  "L4 microkernel family on wikipedia"
     href="https://en.wikipedia.org/wiki/L4_microkernel_family">L4 family of
     microkernels</a>, and is the world's most advanced, most
     highly assured operating-system kernel.
</p>
<p>
  seL4's formal verification sets it apart from any other operating
  system. In a nutshell, it provides the highest assurance of
  <em>isolation</em> between applications running in the system,
  meaning that a compromise in one part of the system can be
  contained and prevented from harming other, potentially more
  critical parts of the system.
</p>
<p>
  Specifically, seL4's implementation is formally (mathematically)
  proven correct (bug-free) against its specification, has been
  proved to enforce strong security properties, and if configured
  correctly its operations have proven safe upper bounds on their
  worst-case execution times. It was the world's first operating
  system with such a proof, and is still the only proven operating
  system featuring fine-grained capability-based security and high
  performance. It also has the most advanced support for <a href=
  "https://en.wikipedia.org/wiki/Mixed_criticality">mixed
  criticality real-time systems</a>.
</p>
<p>
  For detailed explanations of these terms, see our <a href=
  "https://docs.sel4.systems/projects/sel4/frequently-asked-questions.html">FAQ</a>.
</p>
<p>
  In 2009, the seL4 kernel was a scientific breakthrough result
  from the <a href="http://ts.data61.csiro.au/">Trustworthy Systems
  group</a> (TS) that showed that high-performance kernels are
  within the realm of formal verification. Today, seL4 is part of
  an ecosystem supporting active use in various domains including
  automotive, aviation, infrastructure, medical, and defence. A key
  highlight demonstrating its fit for real-world deployment was in
  the DARPA-funded <a href=
  "http://ts.data61.csiro.au/projects/TS/SMACCM/">HACMS</a>
  program, where seL4 was used to protect an autonomous helicopter
  against cyber-attacks. TS continues to push the state of the art
  of operating systems through <a href=
  "http://ts.data61.csiro.au/projects/seL4/">seL4</a>, in close
  cooperation with its partners in the seL4 Foundation.
</p>

<p>
  More on TS ongoing and future <a
  href="more-research.pml">research</a> about seL4 and trustworthy
  systems.
</p>