<!--<title>Summit abstracts</title>-->
<!--
    Copyright 2022, seL4 summit authors (see abstracts)
    SPDX-License-Identifier: CC-BY-SA-4.0
-->
<h4 class="summit-abstract-title">
    The seL4 Verification Roadmap
</h4>
<p class="summit-abstract-type">
    Talk
</p>
<p class="summit-abstract-author">
    Presented by Rafal Kolanski, Gerwin Klein & June Andronick, <span class="summit-abstract-affiliation">Proofcraft</span>
</p>
<p>
    Verification makes seL4 unique. With increasing adoption, seL4 is evolving to support more platforms, architectures, configurations, and features, meaning its formal proofs must evolve as well. Proofcraft is committed to keep this evolution alive. In this talk, we will present the status of the seL4 verification roadmap.
</p>
<p>
    seL4’s extensive formal verification comprises formal proofs of a number of properties for various hardware architectures: AArch32, Intel x64 and RISC-V (64-bit). These properties include:
</p>
<ul>
    <li>Functional correctness: the C code behaves exactly as its abstract specification says.</li>
    <li>Binary correctness: the machine code running on the processor behaves exactly as the C code and, by extension, the specification.</li>
    <li>Security: the specification prevents an applications running on top of seL4 from modifying data without authorisation (integrity), interfering with another’s resource access (availability) and learning information without authorisation (confidentiality).</li>
    <li>System initialisation: combining the above proofs and the capDL specification language, a verified system initialiser can build secure systems where some components require static isolation from others, by correctly setting up access rights at boot time to ensure desired security properties.</li>
</ul>
<p>
    The verification matrix of architectures, properties, configurations and seL4 features is ever evolving. AArch32 still has the most complete proof stack, but RISC-V is catching up. Intel x64 and AArch32 with hypervisor extensions have verified functional correctness. The current roadmap includes completion of the seL4 MCS configuration (support for mixed-criticality systems), functional correctness of seL4 on AArch64, and progress on multicore seL4 verification.
</p>