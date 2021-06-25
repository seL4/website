<!--<title>What is Proved and What is Assumed</title> -->
<!--
    Copyright 2020 seL4 Project a Series of LF Projects, LLC.
    SPDX-License-Identifier: CC-BY-SA-4.0
-->
<h1>
  The Proof
</h1>
<p>
  This page defines in high-level language what the seL4 proofs
  demonstrate, what we assume, and what the proof implies. It is
  aimed at an audience with a technical background, but does not
  assume any expertise in formal verification.
</p>
<h2>
  What we prove
</h2>
<p>
  Formal proofs can be tricky. They prove exactly what you have
  stated, not necessarily what you mean or what you want.
</p>
<p>
  Our proof statement in high-level natural language is the
  following:
</p>
<p>
  <b>The binary code of the ARM version of the seL4 microkernel
  correctly implements the behaviour described in its abstract
  specification and nothing more. Furthermore, the specification
  and the seL4 binary satisfy the classic security properties
  called <em>integrity</em> and <em>confidentiality</em>.</b>
</p>
<p>
  Integrity means that data cannot be changed without permission,
  and confidentiality means that data cannot be read without
  permission.
</p>
<p>
  Our proof even goes one step further and shows that data cannot
  be <em>inferred</em> without permission &ndash; up to a certain
  degree. So-called information <em>side channels</em>&nbsp;are
  known to exist. The proof only covers those information inference
  channels that are present in the formal model: the
  confidentiality proof covers all in-kernel <em>storage</em>
  channels, but excludes <em>timing</em> channels which must be
  dealt with empirically.
</p>
<p>
  Note that this proof statement is much stronger that previous
  versions you might have seen. Previously, in 2009, we had only
  proved functional correctness between the C code of the kernel
  and its specification. Now we have additionally shown binary
  correctness, that is, the compiler and linker need not be
  trusted, and we have shown that the specification indeed implies
  strong security properties as intended.
</p>
<p>
  As with all proofs, there are still assumptions that must be met
  (described below), and there may still be user expectations on
  kernel behaviour that are not captured by the properties proved
  so far. Nevertheless, this degree of strong evidence for security
  and correct functionality has never been achieved before for an
  OS kernel and is currently unrivalled.
</p>
<h2>
  What we assume
</h2>
<p>
  With a proof in formal logic, it is important to understand what
  its basic assumptions are, because this is where fault can still
  occur. Our proof about the seL4 microkernel goes down to the
  level of the binary code.
</p>
<ul>
  <li>
    <b>Assembly:</b> the seL4 kernel, like all operating system
    kernels, contains some assembly code, about 340 lines of ARM
    assembly in our case. For seL4, this concerns mainly entry to
    and exit from the kernel, as well as direct hardware accesses.
    For the proof, we assume this code is correct.
  </li>
  <li>
    <b>Hardware:</b> we assume the hardware works correctly. In
    practice, this means the hardware is assumed not to be tampered
    with, and working according to specification. It also means, it
    must be run within its operating conditions.
  </li>
  <li>
    <b>Hardware management:</b> the proof makes only the most
    minimal assumptions on the underlying hardware. It abstracts
    from cache consistency, cache colouring and TLB (translation
    lookaside buffer) management. The proof assumes these functions
    are implemented correctly in the assembly layer mentioned above
    and that the hardware works as advertised. The proof also
    assumes that especially these three hardware management
    functions do not have any effect on the behaviour of the
    kernel. This is true if they are used correctly.
  </li>
  <li>
    <b>Boot code:</b> the proof currently is about the operation of
    the kernel after it has been loaded correctly into memory and
    brought into a consistent, minimal initial state. This leaves
    out about 1,200 lines of the code base that a kernel programmer
    would usually consider to be part of the kernel.
  </li>
  <li>
    <b>Virtual memory:</b> under the standard of 'normal' formal
    verification projects, virtual memory does <em>not</em> need to
    be considered an assumption of this proof. However, the degree
    of assurance is lower than for other parts of our proof where
    we reason from first principle. In more detail, virtual memory
    is the hardware mechanism that the kernel uses to protect
    itself from user programs and user programs from each other.
    This part is fully verified. However, virtual memory introduces
    a complication, because it can affect how the kernel itself
    accesses memory. Our execution model assumes a certain standard
    behaviour of memory while the kernel executes, and we justify
    this assumption by proving the necessary conditions on kernel
    behaviour. The thing is: you have to trust us that we got
    <em>all</em> necessary conditions and that we got them right.
    Our machine-checked proof doesn't force us to be complete at
    this point. In short, in this part of the proof, unlike the
    other parts, there is potential for human error.
  </li>
  <li>
    <b>DMA:</b> we assume that the CPU and MMU are the only devices
    that access memory directly. The proof can correctly ignore
    memory-mapped registers of devices, but has to assume that DMA
    devices are either not present or do not misbehave, for
    instance by overwriting the kernel. In practise this means,
    that while normal user-level drivers cannot break kernel
    security, drivers for DMA enabled devices can and must be
    formally verified for the proof to carry over. We have current
    work underway to eliminate this assumption using the SystemMMU
    on ARM.
  </li>
  <li>
    <b>Information side-channels:</b> this assumption applies to
    the confidentiality proof only and is not present for
    functional correctness or integrity. The assumption is that the
    binary-level model of the hardware captures all relevant
    information channels. We know this not to be the case. This is
    not a problem for the validity of the confidentiality proof,
    but means that its conclusion (that secrets do not leak) holds
    only for the channels visible in the model. This is a standard
    situation in information flow proofs: they can never be
    absolute. As mentioned above, in practice the proof covers all
    in-kernel storage channels but does not cover timing channels
  </li>
</ul>
<p>
  Note that we <em>do not</em> need to trust the compiler and
  linker any more. Their output is formally verified for seL4 by an
  automatic tool if the kernel is compiled with moderate
  optimisation levels. The same proof for more aggressive
  optimisations is under development.
</p>
<h3>
  What do these assumptions mean?
</h3>
<p>
  The reduced proof assumptions mean that we do not need to trust
  the compiler or linker, but there may still be faults remaining
  in specific low-level parts of the kernel (TLB, cache handling,
  handwritten assembly, boot code). These parts are thoroughly
  manually reviewed.
</p>
<p>
  We have made these assumptions to fit into the carefully limited
  scope and the limited resources of a major research project.
  These specific assumptions are not a limitation of the general
  formal verification approach. In theory, it is possible to
  eliminate all of them: there are at least two prominent research
  groups that have demonstrated successful formal verification of
  assembly code and low-level hardware management functions and we
  have ourselves proved an earlier version of the boot code correct
  down to the level of a precise, executable specification. There
  are still significant scientific challenges in unifying all of
  these into a single framework, but it is clear at this point that
  it can be done.
</p>
<p>
  With all the purity and strength of mathematical proof it is easy
  to get carried away. There is a fundamental theoretical limit of
  formal verification: there will always be some bottom level of
  assumptions about the physical world left and these assumptions
  have to be validated by other means. Mathematical proof is proof
  as long as it talks about formal concepts. It is when assumptions
  connect to reality where things may still fail. Albert Einstein
  is quoted as saying "As far as the laws of mathematics refer to
  reality, they are not certain; and as far as they are certain,
  they do not refer to reality." For instance, if the hardware is
  faulty, or if a cosmic ray randomly changes memory, the
  correctness predictions of our proof do not apply. Neither do any
  traditional tests or verification methods help against cosmic
  rays, but it is important to keep in mind that even with
  mathematical proof, there are no absolute guarantees about the
  physical world.
</p>
<p>
  There are two other assumptions that we do not include in the
  list above, because they are of a different kind:
</p>
<ul>
  <li>We assume the axioms of higher-order logic are logically
  consistent.
  </li>
  <li>We assume our prover checks this particular proof correctly.
  </li>
</ul>
<p>
  The first is a fundamental question of formal logic. If this is
  not true, mathematics in general has a much bigger problem than
  one verified OS kernel. The second is more interesting, but
  equally unlikely to be false.
</p>
<p>
  From security properties down to C code, we use the proof
  assistant <a href="http://isabelle.in.tum.de">Isabelle/HOL</a>.
  This prover belongs to the so-called LCF family of provers and is
  engineered to minimise the code that needs to trusted for the
  proof to be correct. In particular, it supports external proof
  checking by a separate small checking tool. There is no absolute
  guarantee that the proof is correct, but when you come right down
  to it, humans are good at creating proofs, computers are <em>very
  good</em> at checking them. It is an easy problem for computers.
  If you are worried about the proof, be worried about the
  assumptions in the first part. They are much more likely to cause
  problems.
</p>
<p>
  From C code to binary code, we employ a set of automated
  widely-used verification tools. These are: SONOLAR, Z3,
  Isabelle/HOL, and HOL4. The combination of these tools still
  achieves a very high standard of assurance for this last
  verification step and work is underway to cast even this step
  entirely in Isabelle/HOL.
</p>
<h2>
  What the proof implies
</h2>
<p>
  We have already covered the properties that are proved directly:
  functional correctness, integrity, and confidentiality. These are
  high-level properties that every OS should provide, that very few
  manage to provide, and that no OS has better evidence for than
  seL4.
</p>
<p>
  The formal proof of functional correctness implies the absence of
  whole classes of common programming errors. Provided our
  assumptions above are true, some of these excluded common errors
  are:
</p>
<ul>
  <li>
    <b>Buffer overflows:</b> buffer overflows are a classic
    security attack against operating systems, trying to make the
    software crash or even to inject malicious code into the cycle.
    We have proved that no such attack can be successful on seL4.
  </li>
  <li>
    <b>Null pointer dereferences:</b> null pointer dereferences are
    another common issue in the C programming language. In
    applications they tend to lead to strange error messages and
    lost data. In operating systems they will usually crash the
    whole system. They do not occur in seL4.
  </li>
  <li>
    <b>Pointer errors in general:</b> in C it is possible to
    accidentally use a pointer to the wrong type of data. This is a
    common programming error. It does not happen in the seL4
    kernel.
  </li>
  <li>
    <b>Memory leaks:</b> memory leaks occur when memory is
    requested, but never given back. The other direction is even
    worse: memory could be given back, even though it is still in
    use. Neither of these can happen in seL4.
  </li>
  <li>
    <b>Arithmetic overflows and exceptions:</b> humans and
    mathematics usually have a concept of numbers that can be
    arbitrarily big. Machines do not, they need to fit them into
    memory, usually into 32 or 64 bits worth of storage. Machines
    also generate exceptions when you attempt to do things that are
    undefined like dividing by zero. In the OS, such exceptions
    would typically crash the machine. This does not occur in seL4.
  </li>
  <li>
    <b>Undefined behaviour:</b> there are many static analysis and
    verification tools that check for the absence of undefined
    behaviour in C. Our proof explicitly checks that no such
    undefined behaviour occurs.
  </li>
</ul>
<p>
  The list goes on. There are other techniques that can also be
  used to find some of these errors. Here, the absence of such bugs
  is just a useful by-product of the proof. To be able to complete
  our proof of functional correctness, we also prove a large number
  of so-called invariants: properties that we know to always be
  true when the kernel runs. To normal people these will not be
  exciting, but to experts and kernel programmers they give an
  immense amount of useful information. They give you the reasons
  why and how data structures work, why it is OK to optimise and
  leave out certain checks (because you know they will be always be
  true), and why the code always executes in a defined and safe
  manner.
</p>
<h2>
  What's next?
</h2>
<p>
  Even after binary and security proofs, we are still just at the
  beginning of verifying entire systems. See our <a href=
  "http://trustworthy.systems/projects/TS/">current research
  projects</a> for more things to come. Contact TS if you would
  like to collaborate, for instance by connecting your formally
  verified application to the seL4 proof, or by building an entire
  verified system.
</p>
