---
---
<!--<title>Summit abstract</title>-->
<!--
    Copyright 2023, seL4 summit authors (see abstracts)
    SPDX-License-Identifier: CC-BY-SA-4.0
-->
<h4 class="summit-abstract-title">
More multiprocessing on seL4: Are efficient SMP virtual machines possible on verifiable seL4 kernels?
</h4>
<p class="summit-abstract-type">
    Talk
</p>
<p class="summit-abstract-author">
    Presented by Kent McLeod, <span class="summit-abstract-affiliation">Kry10</span>
</p>
<p>
Multicore systems with verified seL4 is just around the corner with multikernels - kernel state is isolated on each core and avoid kernel-mode concurrency for easier verification. Does this mean that it's not possible to support multicore at user level? Let's find out by investigating whether it's possible to efficiently support virtualizing SMP virtual machines
with small core counts using our multikernel mechanisms.
</p>
<p>
This talk will detail how to construct such a system, the work involved and examples of how it can be used.
</p>