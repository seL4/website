---
---
<!--<title>Summit abstract</title>-->
<!--
    Copyright 2023, seL4 summit authors (see abstracts)
    SPDX-License-Identifier: CC-BY-SA-4.0
-->
<h4 class="summit-abstract-title">
    Formally Stepping Into The Unverified World
</h4>
<p class="summit-abstract-type">
    Talk
</p>
<p class="summit-abstract-author">
    Presented by Sandy Frost, <span class="summit-abstract-affiliation">Los Alamos National Laboratory</span>
</p>
<p>
With the rise in high profile attacks against safety and security critical systems, formal methods are being considered as a defensive option across many domains, such as with critical infrastructure, since they can prove that software behaves exactly according to specification, therefore minimizing software vulnerabilities. Unfortunately, there has been slow adoption of this technology due to technical (e.g., performance limitation of verification tools) and non-technical (e.g., unfamiliarity with concepts, difficult to implement) reasons. We propose an analysis of the interface between formally (checking software against specifications) and non-formally verified components, to better understand the impacts to system robustness. This work has the potential to be transformational by enabling wider adoption of this defensive measure.
</p>
<p>
We are analyzing system interaction impacts between components that are formally verified and those that are not using a e.g., seL4-provided channel with approved access control. The seL4 microkernel, which is the minimal core of an operating system provides strong isolation. To allow communication between components, seL4 must enable fine-grained access control, which is an explicitly enabled communication channel for a desired operation.
</p>
<p>
This talk is relevant to the seL4 scope because it covers an seL4 experience report relevant to developing capabilities toward “building a business case for using a verified kernel”. In order to use a verified kernel, especially with critical components, it is important to know its potential limitations and special considerations, therefore exploring the kernel’s interactions with components that might not be verified is paramount.
</p>