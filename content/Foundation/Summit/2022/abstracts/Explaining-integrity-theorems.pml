<!--<title>Summit abstracts</title>-->
<!--
    Copyright 2022, seL4 summit authors (see abstracts)
    SPDX-License-Identifier: CC-BY-SA-4.0
-->
<h4 class="summit-abstract-title">
    Explaining the seL4 integrity theorems
</h4>
<p class="summit-abstract-type">
    Talk
</p>
<p class="summit-abstract-author">
    Presented by Matt Brecknell, <span class="summit-abstract-affiliation">Kry10</span>
</p>
<p>
    Kry10 is building a cost-effective platform for connected devices, with extreme security and reliability. We choose to build on seL4 because its capability model gives us the mechanisms, and its verification gives us the confidence that we need. But how do we understand what the verification says about how we should use seL4's mechanisms to build secure systems?
</p>
<p>
    From the functional correctness and invariant proofs, we know that the implementation has no behaviours that aren't permitted by the specification, and that the specification is internally consistent. But the specification still contains considerable detail. When viewed from the perspective of a user outside the kernel, it can be hard for a mere mortal to infer the security properties of a particular system design.
</p>
<p>
    In this presentation, we will look at the seL4 integrity theorems, which give us an abstract way to understand the authorities that components in a system have over each other. We'll see how to construct abstract authority graphs, called policies, and how they relate to individual system states through policy refinement. Policy refinement is a purely static view of the system state, which is appropriate for system initialisation, but we're also interested in how the system evolves from its initial state. So we define integrity as the system state changes that we want to allow for a given policy, and prove that actual state changes are bounded by that definition. Note that integrity does not tell us whether the new state is governed by the same policy, so a separate proof, called authority confinement, shows that state changes preserve the policy refinement.
</p>
<p>
    Both theorems are subject to some well-formedness assumptions about the policy. These assumptions are important for system designers who want the benefit of the theorems, because they act as constraints on their system designs. So we'll examine these conditions in detail, and consider what they mean for static systems such as those produced by the CAmkES tool and the capDL loader. We'll also look at more dynamic systems, where we'll see that with careful design, the theorems can still provide some benefit.
</p>