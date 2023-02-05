<!--<title>Summit abstracts</title>-->
<!--
    Copyright 2022, seL4 summit authors (see abstracts)
    SPDX-License-Identifier: CC-BY-SA-4.0
-->
<h4 class="summit-abstract-title">
    Kry10 Secure Platform: Trust but Isolate
</h4>
<p class="summit-abstract-type">
    Keynote
</p>
<p class="summit-abstract-author">
    Presented by Boyd Multerer, <span class="summit-abstract-affiliation">Kry10</span>
</p>
<p>
    The Kry10 Secure Platform is a new seL4-based platform that brings security and reliability to industrial connected devices. The platform is based on a philosophy of "Trust but Isolate" - build trusted software to the best quality, but isolate it so that if problems do occur, they cannot spread to the rest of the system.
</p>
<p>
    "Trust but isolate" requires: strict spatial and temporal isolation for OS processes, modular system design that benefits from and takes advantage of isolation to contain any errors, and the ability for application and OS software to be restarted and updated without causing downtime for the rest of the system.
</p>
<p>
    The foundation of the Kry10 Secure Platform is Kry10 OS (KOS), an OS based on the guaranteed isolation provided by the seL4 microkernel. KOS builds on top of seL4, providing a dynamic runtime environment that allows for a flexible and updateable system architecture. KOS integrates an Elixir-based application environment bringing the resilience and concurrency benefits of the BEAM to connected devices. KOS also enables fine-grained and efficient system updates, so that updates can be performed on specific application or system components without affecting other running components, thus virtually eliminating the need for scheduled downtime. Finally, KOS provides a high quality development environment with API and tools that are designed to be consistent, understandable, and usable.
</p>
<p>
    In this presentation we will introduce the Kry10 Secure Platform with its Trust but Isolate philosophy, and then show how the Kry10 Operating System implements this philosophy to achieve a secure and robust platform for industrial connected devices.
</p>