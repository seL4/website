<!--<title>Summit abstracts</title>-->
<!--
    Copyright 2022, seL4 summit authors (see abstracts)
    SPDX-License-Identifier: CC-BY-SA-4.0
-->
<h4 class="summit-abstract-title">
    Trustworthy board management controllers
</h4>
<p class="summit-abstract-type">
    Talk
</p>
<p class="summit-abstract-author">
    Presented by Daniel Schwyn & Ben Fiedler, in collaboration with Michael Giardino, David Cock & Timothy Roscoe, <span class="summit-abstract-affiliation">ETH</span>
</p>
<p>
    Most modern computing platforms are so complex that they need a separate embedded system to manage them. These systems are referred to as (Base-)Board Management Controllers or BMCs. BMCs handle power and clock distribution and sequencing, firmware for other components on the board, and usually offer remote management capabilities (e.g. console access and firmware updates). This makes them the root of trust in such systems.
</p>
<p>
    Although BMCs have absolute power over modern computing platforms they are not engineered in the rigorous way that warrants the implicit trust that we put in them. In our talk we will present ongoing work on declarative power and clock management and our broader vision of a trustworthy BMC software stack with, at its heart, seL4 as a separation kernel. Not only will a trustworthy BMC stack improve safety and security of modern computing platforms but, with the right tools for generating code from declarative models, it has the potential to shorten bringup times for new platforms.
</p>
