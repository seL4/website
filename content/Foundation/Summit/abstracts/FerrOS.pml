<!--<title>Summit abstracts</title>-->
<!--
    Copyright 2022, seL4 summit authors (see abstracts)
    SPDX-License-Identifier: CC-BY-SA-4.0
-->
<h4 class="summit-abstract-title">
    FerrOS: Rust-y unikernels on seL4 w/ compile-time assurances
</h4>
<p class="summit-abstract-type">
    Experience report
</p>
<p class="summit-abstract-author">
    Presented by Zack Pierce, <span class="summit-abstract-affiliation">Auxon</span>
</p>
<p>
    Even though seL4 promises that our resources are isolated, how can we know those resources are enough to fuel our applications? FerrOS is an approach to answering that question by using Rust's type system to layer resource management abstractions on top of seL4 primitives. This talk covers the productivity advantages of teaching a compiler to check that the right kinds of capabilities are in the right places, the tradeoffs between rigid and fluid modes of development, and the branching future paths for Rust with seL4.
</p>