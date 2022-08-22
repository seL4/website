<!--<title>Summit abstracts</title>-->
<!--
    Copyright 2022, seL4 summit authors (see abstracts)
    SPDX-License-Identifier: CC-BY-SA-4.0
-->
<h4 class="summit-abstract-title">
    The seL4 Core Platform (seL4CP)
</h4>
<p class="summit-abstract-type">
    Talk
</p>
<p class="summit-abstract-author">
    Presented by Zoltan Kocsis, <span class="summit-abstract-affiliation">UNSW</span>
</p>
<p>
    The seL4CP is a very lightweight OS environment for seL4 that’s presently being developed by Breakaway in collaboration with TS. Compared to CAmkES, seL4CP abstractions map more directly on seL4 primitives, and it dissociates app development from the kernel build system, allowing easier integration into the developer’s preferred development environment. The seL4CP was originally presented as a concept at the 2020 seL4 Summit. It now has an implementation that is already used in products. The talk will provide a refresher on the seL4CP’s concepts and will the discuss recent/on-going work, which falls into two broad categories:
</p>
<p>
a) Verification: this has itself two thrusts:
</p>
<ul>
    <li>functional correctness of the seL4CP itself</li>
    <li>verified mapping of the seL4CP spec to CapDL, similar as was done for CAmkES</li>
</ul>
<p>
    b) Adding dynamic features to seL4CP. This is a multi-step process, of making apps restartable to supporting empty app slots that can load arbitrary apps at run time
</p>
<p>
    Both categories are work in progress, with prototypes of partial functionality available at time of writing, significant progress is expected by the time of the Summit.
</p>
