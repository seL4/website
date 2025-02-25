---
SPDX-License-Identifier: CC-BY-SA-4.0
SPDX-FileCopyrightText: 2020 seL4 Project a Series of LF Projects, LLC.
title: seL4 White Paper
pre: What is seL4?
pre_link: index.html
sub: '
  <p>
    The seL4 white paper provides an introduction and overview
    for seL4, including seL4&apos;s assurance story, its security- and safety
    features, and its benchmark-setting performance. It also shows typical
    usage scenarios.
  </p>
  <div class="flex justify-center items-center pt-6">
    <a href="seL4-whitepaper.pdf" class="button-outline px-10">Download White Paper</a>
  </div>'
---

<div class="mx-10 mb-6 float-left w-1/3">
  <a href="seL4-whitepaper.pdf">
  <img src="whitepaper.svg" alt="seL4 white paper" />
  </a>
</div>

seL4 is a high-assurance, high-performance operating system microkernel. It is
unique because of its comprehensive formal [verification](../Verification/),
without compromising [performance](Performance/). It is meant to be used as a
trustworthy foundation for building safety- and security-critical systems. It is
available as open source on [GitHub](https://github.com/seL4/) and supported by
the [seL4 Foundation](../Foundation/).

Being a *kernel* means it is the piece of software that runs at the
heart of any software system and controls all accesses to resources. It
provides fine-grained access control through
[capabilities](https://en.wikipedia.org/wiki/Capability-based_security),
and controls communication between components of the system. It is the
most critical part of the software system, and runs in privileged mode.

Being a *microkernel* means that it is reduced to a minimal core that is
free from policy and therefore can form a dependable base for building
arbitrary systems serving many different usage scenarios.

seL4 is a member of the [L4 family of
microkernels](https://en.wikipedia.org/wiki/L4_microkernel_family "L4 microkernel family on wikipedia"),
and is the world's most advanced, most highly assured operating-system
kernel.

seL4's [formal verification](../Verification/) sets it apart from any other
operating system. In a nutshell, it provides the highest assurance of
*isolation* between applications running in the system, meaning that a
compromise in one part of the system can be contained and prevented from harming
other, potentially more critical parts of the system.

Specifically, seL4's implementation is formally (mathematically) proven correct
against its specification and has been proved to enforce strong security
properties. It was the world's first operating system with such a proof, and is
still the only proven operating system featuring fine-grained capability-based
security and high performance. It also has the most advanced support for [mixed
criticality real-time systems](https://en.wikipedia.org/wiki/Mixed_criticality).

The figure below shows one of the uses for seL4: isolation between trusted and
untrusted components in a system, including full virtual machines.

<div class="w-1/2 my-6 mx-auto aspect-3/2">
{% svg /images/tries-shutterstock/sel4-principles.drawio.svg width="100%" %}
</div>

In the diagram, the seL4 kernel is the layer directly above the hardware,
mediating access to it. On top of seL4, this example is running a virtual
machine with untrusted code, some native applications with untrusted code, and
some native applications with critical trusted code. The kernel isolates trusted
from untrusted code and provides secure, controlled communication mechanisms
between them. In the example, the system is configured to only allow
communication via the trusted application, which for instance could implement
custom security policies.

For detailed explanations of these terms, see our [FAQ](FAQ.html). For a more
detailed introduction to seL4, read the full [White Paper](seL4-whitepaper.pdf).
