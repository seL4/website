---
---
<!--<title>Summit abstract</title>-->
<!--
    Copyright 2023, seL4 summit authors (see abstracts)
    SPDX-License-Identifier: CC-BY-SA-4.0
-->
<h4 class="summit-abstract-title">
    Scoping assurance activities with seL4
</h4>
<p class="summit-abstract-type">
    Keynote
</p>
<p class="summit-abstract-author">
    Presented by Gage B, <span class="summit-abstract-affiliation">NCSC</span>
</p>
<p>
In both the safety and security industries, high levels of product assurance are sought to mitigate the risk of product failure. Often this means that software developers need to demonstrate that all functions do what they are supposed to do, the product does not do anything it is not supposed to do, and that the product is free from all known bugs and vulnerabilities.
</p>
<p>
Whilst none of these requirements have trivial solutions, testing does a reasonable job of checking the correctness of functions. Similarly, taking advantage of tooling (such as static analysis, dynamic analysis), tracking the discovery of bugs and vulnerabilities, and having a refined software patching process helps to mitigate the presence of bugs and vulnerabilities. However, it is much less obvious how one can gain confidence that the software has no unintended functionality without checking the entire software implementation. Even then, the scope of what you need to check is potentially unbounded (we’re looking for the unknown unknowns after all), issues will still be missed, and the resource requirements are high.
</p>
<p>
In this talk, I will describe how basing a software product on seL4 facilitates the scoping of this no unintended functionality problem, and in turn, reduces the amount of effort required when it comes to demonstrating assurance of a security product. By walking through an example, we’ll observe the assurance benefits of component isolation, data flow control, how seL4 helps to direct where we should focus our assurance efforts, and any caveats we should be aware of.
</p>
<p>
Accepting that the assurance effort should be commensurate with the criticality of the security product, my hope is that this presentation provides a sliding scale of seL4 features we should seek to take advantage of, be it for articulating an assurance case, or conducting an independent assessment.
</p>