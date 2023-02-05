<!--<title>Summit abstracts</title>-->
<!--
    Copyright 2022, seL4 summit authors (see abstracts)
    SPDX-License-Identifier: CC-BY-SA-4.0
-->
<h4 class="summit-abstract-title">
    fence.t: hardware support for preventing microarchitectural timing channels
</h4>
<p class="summit-abstract-type">
    Talk
</p>
<p class="summit-abstract-author">
    Presented by Nils Wistoff, <span class="summit-abstract-affiliation">ETH</span>
</p>
<p>
    Microarchitectural timing channels enable information transfer between security domains that are supposed to be isolated, bypassing the operating system's security boundaries. They result from shared microarchitectural state that depends on execution in one security domain and impacts timing in another. Since modern ISAs do not specify timing behaviour, they are insufficient to address these channels.
</p>
<p>
    In this talk, we present fence.t, a novel RISC-V instruction that clears the processor's microarchitectural state and thus any timing dependence on execution history. We show how this instruction was implemented in an open-source RISC-V core and integrated into an experimental version of seL4 with time protection. Furthermore, we will address the challenges of fence.t and its future roadmap.
</p>