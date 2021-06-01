<!--<title>Ongoing and future fundamental research about seL4 and trustworthy systems</title> -->
<!--
    Copyright 2020 seL4 Project a Series of LF Projects, LLC.
    SPDX-License-Identifier: CC-BY-SA-4.0
-->
<h1>
  Ongoing and future fundamental research on seL4 and trustworthy systems
</h1>

<p>

  While seL4 is mature enough to be deployed in the real world,
  there’s plenty of fundamental research work left on seL4 itself, and
  there is far more research left on how to achieve real-world
  trustworthy computer systems. More on both below, describing the
  <a href="https://ts.data61.csiro.au">Trustworthy Systems group</a>'s
  research agenda (as of May 2021),
  looking for further funding to tackle these challenges. This is
  largely extracted from this <a
  href="https://microkerneldude.wordpress.com/2021/05/31/trustworthy-systems-research-is-done-are-you-kidding-csiro/">blog</a>.


</p>

<h3>
  Work to do: seL4
</h3>

<p>
  The seL4 <i>kernel</i> is mature in many ways, good enough to be
  deployed in real-world systems. It is already in daily use in the
  real world, and is being designed into many more systems. But there
  is still more research to be done.
</p>

<p>
  Right now, seL4 solves a number of fundamental security problems,
  and it provides the best possible solution to these problems. In
  particular, it provides the strongest possible <i>spatial</i> isolation, in
  that it guarantees that memory cannot be accessed without explicit
  authorisation. It also provides strictly controlled communication
  between subsystems, in that two subsystems (provably) cannot
  communicate through system calls or memory unless explicitly
  authorised. And it does this with unbeaten performance. This is more
  than any other real-world OS can give you.
</p>

<p>
  What seL4 cannot (yet) do, and no other OS can either, is to provide
  temporal isolation guarantees. This comes in two guises, the
  <i>integrity</i> and the <i>confidentiality</i> aspect.
</p>

<p>
  Here, integrity means the ability to guarantee timeliness of
  real-time systems, especially <i>mixed-criticality systems</i> (MCS), where
  critical, high-assurance real-time tasks operate concurrently to
  untrusted code. seL4’s new MCS model provides temporal integrity to
  a significant class of MCS, and its verification is
  on-going. However, it does not yet fully <i>solve</i> the
  problem. Specifically, we found that there are important use cases
  for which the present MCS model is not sufficient. On-going research
  is addressing this, leading to further improvements of the model.
</p>

<p>
  Furthermore, we have not yet developed the formal framework for
  reasoning about timing guarantees on top of the MCS model. This is,
  of course, what is needed for making high-assurance MCS a reality,
  and is a significant research challenge, which is presently
  unfunded. Again, while we’re ahead of any other system, the world’s
  emerging cyberphysical systems need more.
</p>

<p>
  Much more work remains on the <i>confidentiality</i> side: Here the
  problem is to guarantee that there is no information leakage through
  <a href="https://en.wikipedia.org/wiki/Covert_channel#Timing_Channels">covert timing channels</a>; this kind of leakage is a serious real-world
  problem, as demonstrated in the <a
  href="https://en.wikipedia.org/wiki/Spectre_(security_vulnerability)">Spectre
  attacks</a>. Timing channels have long been put into the too-hard
  basket by most people. Triggered by Spectre there is now a flurry of
  activity, but most are band-aid solutions addressing symptoms. In
  contrast, we are working on a principled, fundamental approach to a
  complete prevention of timing channels. We call this approach <i>time
  protection</i>, in analogy to the established memory protection. The
  feedback from the research community has been strong: the work has
  already won three best-paper awards, yet we are only at the
  beginning of this line of work.
</p>

<p>
  Specifically we have designed some basic OS mechanisms for providing
  time protection, and have shown that they can be effective on the
  right hardware, but also that contemporary hardware is
  deficient. Presently, with support by the Australian Research
  Council and the US Air Force, we are working on proving that these
  mechanisms are effective on suitable hardware. This work has
  progressed well and needs further funding.
</p>

<p>
  We are also working with the RISC-V community on defining
  appropriate hardware support to allow time protection to do its
  job. But much more research is needed on the OS side, as so far we
  have some basic mechanisms, that work in very restricted use
  cases. It’s far from having an OS model that addresses the large
  class of systems where timing channels are a security threat. This
  work is presently unfunded.
</p>

<p>
  And finally, we have not yet solved the problem of verifying seL4
  for multicore platforms. While there exist kernels with a multicore
  verification story, these kernels have performance that makes them
  unsuitable for real-world use. Thanks to our past research we now
  understand <i>how</i> to verify multicore seL4, but we need funding to do
  it.
</p>



<h3>
  Work to do: Scaling trustworthiness to full systems
</h3>

<p>
  Beyond seL4, there’s the wider Trustworthy Systems agenda: creating
  a societal shift towards mainstream adoption of software
  verification. We have made some progress here, with verification
  uptake increasing in academia and industry, but it’s far from
  mainstream.
</p>

<p>
  To enable this shift, the team has more concrete research
  goals. These include:
</p>

  <ul>
  <li>
    Lower-cost approaches for verifying the non-kernel parts of the
    trusted computing base, such as device drivers, file and network
    services, but also the actual applications. So far, verified
    software is still more expensive to produce than the usual buggy
    stuff (although life-cycle cost is probably already
    competitive). Trustworthy Systems’ declared aim is to produce
    verified software at a cost that’s at par with traditionally
    engineered software;
  </li>
  <li>
    Proofs of high-level security properties of a complete system (as
    opposed to “just” the underlying microkernel);
  </li>
  <li>
    Proofs of timeliness of a complete real-time system built on seL4;
  </li>
  <li>
    Design of a general-purpose operating system that is as broadly
    applicable as Linux, but where it is possible to prove security
    enforcement.
  </li>
  </ul>

<p>
  These are all research challenges that remain unsolved, are of high
  importance for the security and safety of real-world systems and
  which the Trustworthy Systems group is in a prime position to
  address. We have the track record and credibility to deliver, and
  need funding to do it.
</p>
