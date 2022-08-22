<!--<title>Summit abstracts</title>-->
<!--
    Copyright 2022, seL4 summit authors (see abstracts)
    SPDX-License-Identifier: CC-BY-SA-4.0
-->
<h4 class="summit-abstract-title">
    A Verified Achitecture for Trustworthy Remote Attestation
</h4>
<p class="summit-abstract-type">
    Talk
</p>
<p class="summit-abstract-author">
    Presented by Grant Jurgensen, <span class="summit-abstract-affiliation">The University of Kansas</span>
</p>
<p>
    Remote attestation is a process where one digital system gathers and provides evidence of its state and/or identity to an external system. The external system appraises the attestation evidence to make judgments over the attesting system. For this process to be successful, the appraiser must find the attestation evidence to be convincingly trustworthy. Remote attestation is difficult to make trustworthy due to the appraiser’s limited access to the attestation target. In contrast to local attestation, the appraising system is unable to directly observe and oversee the attestation target. In this work, we present a system architecture design and prototype implementation that we claim enables trustworthy remote attestation.
</p>
<p>
    This architecture defines a layered system consisting of seL4 and a Linux virtual machine contained therein. Existing Linux systems may easily be run within the virtual machine, and augmented by coordinated attestation components running both at the Linux and seL4 level. We argue that this layered design offers both the flexibility to accommodate existing systems as wells as rigorous and trustworthy attestation capabilities.
</p>