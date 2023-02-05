<!--<title>Summit abstracts</title>-->
<!--
    Copyright 2022, seL4 summit authors (see abstracts)
    SPDX-License-Identifier: CC-BY-SA-4.0
-->
<h4 class="summit-abstract-title">
    seL4 microkernel for virtualization use-cases "The importance of a standard VMM"
</h4>
<p class="summit-abstract-type">
    Talk & Discussion
</p>
<p class="summit-abstract-author">
    Presented by Everton de Matos, in collaboration with Jason Sebranek, <span class="summit-abstract-affiliation">TII+Cog</span>
</p>

<p>
    Using seL4 in complex production environments brings new challenges often quite different from research-oriented environments. At a high level, there are gaps in the seL4 stack, specifically the VMM, userspace, and tooling, which complicate matters for integrators attempting to meet real-world customer use cases. Not all business opportunities require a solution using a VM architecture, but those that do quickly become complex and would benefit enormously from an established standard or reference baseline. The lack of a robust and consistent VMM for seL4 has created a highly fractured environment. Most integrators have their own specialized customer use cases, and they have found that the quickest path is to use a forked and modified VMM. This practice may have short-term benefits to that integrator. Still, it does not allow the community to benefit from commonality and guarantees that the fork will get old and out of sync with the mainline.
</p>
<p>
    This talk proposes to establish a driving philosophy to design a baseline VMM rather than prescribe a specific system architecture. We intend to discuss the possible missing features of the existing seL4 VMM concerning standardization, more so than a prescription for the right way to do it. Indeed, this will entail recommending high-level architecture patterns but cannot lock an adopter into specific implementations. Each adopting integrator will inevitably start from the new standard and refine the implementation for their use case. The effort here is to close the gap between the current VMM baseline and the point of necessary deviation.
</p>