<!--<title>Summit abstracts</title>-->
<!--
    Copyright 2022, seL4 summit authors (see abstracts)
    SPDX-License-Identifier: CC-BY-SA-4.0
-->
<h4 class="summit-abstract-title">
    seL4 and BEAM: a match made in Erlang
</h4>
<p class="summit-abstract-type">
    Talk
</p>
<p class="summit-abstract-author">
    Presented by Ihor Kuz, <span class="summit-abstract-affiliation">Kry10</span>
</p>
<p>
    When building secure and robust systems, the general strategy is to "prevent, contain, and recover". Ideally we <strong>prevent</strong> problems (like errors and vulnerabilities) from occurring in the first place, <strong>contain</strong> the effects of any problems that do occur, and <strong>recover</strong> from those problems by repairing any damage and ensuring the problems do not happen again in the future.
</p>
<p>
    SeL4 provides excellent spatial and temporal isolation mechanisms to help contain any potential problems, but it does not address prevention and recovery - gaps left for user-level software running on top of the kernel. The BEAM virtual machine and its Erlang and Elixir programming environments provide one of the best opportunities to fill these gaps. Developing code based on the BEAM and its programming environments prevents many errors from occurring, leading to robust user-level components. The BEAM also provides strong fault-recovery mechanisms based on its supervision trees and a "crash and restart" philosophy coupled with dynamic code (re)loading. This, combined with seL4's strong isolation, leads to systems that can realise the full "prevent, contain, and recover" strategy.
</p>
<p>
    In this presentation we will demonstrate what can be achieved by combining seL4 and the BEAM. We will also describe our experience with building BEAM-based systems on seL4, including porting the BEAM to run on seL4, integrating the BEAM with seL4 inter-process communication mechanisms and other C-based components, and creating a powerful Elixir-based development environment for seL4 systems.
</p>