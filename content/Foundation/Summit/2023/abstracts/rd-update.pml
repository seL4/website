---
---
<!--<title>Summit abstract</title>-->
<!--
    Copyright 2023, seL4 summit authors (see abstracts)
    SPDX-License-Identifier: CC-BY-SA-4.0
-->
<h4 class="summit-abstract-title">
R&D Update from TS
</h4>
<p class="summit-abstract-type">
    Talk
</p>
<p class="summit-abstract-author">
    Presented by Gernot Heiser, <span class="summit-abstract-affiliation">UNSW</span>
</p>
<p>
I will given an overview of seL4-related research and development at Trustworthy Systems.
</p>
<p>
At the core of our present work is the design and implementation of a new OS personality for IoT/embedded/cyberphysical systems that is based on the KISS principle – keep it simple, stupid! We take simplicity to the extreme, with fine-grained modularity driven by strict separation of concerns, resulting in extremely simple modules, most just comprising a few hundred lines of code. This is possible by abandoning the 1980's model of an OS, implemented by almost all contemporary OS designs, that strives to provide general (and thus inherently complex) policies. Our approach is the opposite: extremely use-case-specific policies, that are simple to implement, and trivial to replace. Our experience with networking (see the preceding talk by Lucy) shows that this approach is not only feasible, it can also be highly performant.
</p>
<p>
Highly aligned to the above is our work on the use of push-button verification of OS components. We have demonstrated that we can verify the implementation of the seL4 Core Platform this way: Once a suitable specification is created, the SMT solver provides the proof without further manual action. We have furthermore created an automated translation-validation toolchain, using a similar apporach as for the binary verification of seL4, that proves the correctness of a mapping of the seL4CP system specification (SDF) to the CapDL formalism that describes low-level access rights in an seL4 system (and that can produce a verified system initialiser).
</p>
<p>
Our experience with verifying seL4CP makes us confident that we can verify (at least) core components of our new KISS-based OS using the same push-button approach. This creates the exciting prospect that in the near future we will have an OS that is not only easy to use, yet high performant, but also at least partially verified.
</p>
<p>
Our third major activity is Pancake, our new systems language aimed at easing verification of OS components, especially device drivers. Pancake has a verified compiler, meaning that correctness proofs can be based on the semantics of Pancake rather than dealing with the complexities of C. We have already used Pancake to implement some components of the networking system, although significant work remains to be done.
</p>
<p>
I will finally give an update on our work on verified Time Protection, the principled prevention of microarchitectural timing channels, as wel as the SMOS project, which is designing a fully dynamic, general-purpose OS that can be proved to enforce a security policy.
</p>