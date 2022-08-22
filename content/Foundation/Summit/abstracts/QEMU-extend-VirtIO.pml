<!--<title>Summit abstracts</title>-->
<!--
    Copyright 2022, seL4 summit authors (see abstracts)
    SPDX-License-Identifier: CC-BY-SA-4.0
-->
<h4 class="summit-abstract-title">
    Using QEMU to extend seL4 VirtIO support
</h4>
<p class="summit-abstract-type">
    Talk
</p>
<p class="summit-abstract-author">
    Presented by Hannu Lyytinen, in collaboration with Markku Ahvenjärvi, <span class="summit-abstract-affiliation">TII</span>
</p>
<p>
    The traits of seL4 makes it an appealing hypervisor platform. Today hypervisors are increasingly used to build complex security- and safety critical systems. Good and stable abstractions are required to build upon, and that in turn needs a vivid community of developers and maintainers. Having access to stable and high quality drivers can help building such a community, and is one step towards having seL4 on par feature-wise with the other hypervisors. At TII we explored if QEMU could be used as a VirtIO backend for seL4. The QEMU would bring the tried and tested VirtIO backend, and already thriving ecosystem to work with. Having VirtIO backend running in a Linux VMs user space has its benefits, but also comes with an overhead cost. This talk walks through our journey with having a QEMU within a Linux VM on top of seL4 to provide paravirtualized devices to the other VMs. We share how we went about getting the QEMU working with seL4 along with the benchmarks, the learnings and the pain points. We share where we are at the moment, and our plans for the future.
</p>