---
SPDX-License-Identifier: CC-BY-SA-4.0
SPDX-FileCopyrightText: 2020 seL4 Project a Series of LF Projects, LLC.
title: How to use seL4
sub: '
<p>
seL4 is a fast, secure, and formally verified microkernel. So what can you do with it?
</p>'
pre: "What is seL4?"
pre_link: "./"
---

## Use seL4 as a fast and secure RTOS

seL4 provides fast and secure OS kernel mechanisms that you can use on otherwise
bare metal to build systems as you would with a small RTOS. You need to provide
your own drivers or adapt them from other sources, and you are free to design
your system however you want with minimal overhead and correctness guarantees
for the mechanisms that seL4 provides. You can design your system directly on
the seL4 API or use one of the [existing tools and frameworks][tools] to get
started quickly.

## Use seL4 as a Hypervisor

You can use seL4 as a hypervisor to virtualise other guest operating systems
such as Linux. Generally, you would use one of the [existing seL4 virtual
machine monitors][VMMs] for this, or write your own. You can use seL4 to
restrict resources for virtual machines, or pass them through. Most of the
virtual machine monitor code is a library component that runs in user mode. That
means, bugs in the virtual machine monitor can be contained to a single virtual
machine (VM) and cannot propagate to the rest of the system.

## Use seL4 as Hypervisor and RTOS at the same time

Since virtual machine monitors are just user space components like any others on
seL4, you can freely run native seL4 user components next to or in communication
with virtual machines. This can be an extremely powerful mix, enhancing and
controlling what virtual machines can do. For instance, you could run legacy
code in one VM, use a complex Linux driver in a separate driver VM, and connect
them via a native cryptography components and network filter. The legacy code
may still have bugs, but they cannot affect the crypto component. The complex
driver may still have bugs, but it also cannot affect the crypto component -- at
most it can provide invalid input. The legacy code might be vulnerable to buffer
overflow attacks, but the network filter could check input before it reaches any
legacy code. And the system architecture in conjunction with seL4 can guarantee
for you that the filter cannot be bypassed.

<div class="w-2/3 my-6 mx-auto aspect-3/2">
{% svg /images/tries-shutterstock/sel4-principles.drawio.svg width="100%" %}
</div>

## Use seL4 to architect Secure Systems

You can use seL4 to build systems that have security designed-in from the ground
up. Think which security properties are the most important to guarantee. Design
the architecture of your system such that these properties are guaranteed by the
structure of the system and possibly a small number of small, trusted components
that can be thoroughly analysed or even formally verified. seL4 and verified
user-level system initialisation can give you that the architecture you have
designed is in fact the architecture that is running in your system, and that
the boundaries and communication channels of that architecture are enforced.

You can use components such as filters, sanitisers, authentication, integrity
protection, secrets store, cryptography, etc to reduce trust and analysis effort
to the places that matter. Context switching in seL4 is seriously fast -- you
can afford a lot more components and protection domains than you would in other
systems.

This leverages the strong formal verification of seL4 without needing any
specific formal verification expertise. If you do want to apply further formal
verification to the system, you can now verify small parts of the system to gain
system-global security properties.

Even without further analysis and verification, the system benefits from a
componentised security architecture by being easier to understand and
communicate about. Knowing which parts of the system are security critical and
which are not, and being sure that uncritical parts cannot destroy security
enables you to move fast *without* breaking things.

You can also leverage the formal verification of seL4 to speed up debugging and
failure analysis during development: you know the verified code didn't fail, and
isolation wasn't broken. This means you can focus your analysis on much fewer
lines of code when something goes wrong.

<!-- FIXME: add a diagram with a small obvious security property -->

## Use seL4 for Cyber Retrofit

Imagine a heap of legacy code and a mandate to make it secure. Putting it behind
a firewall will not make it secure, and there is no time for rewriting it from
scratch. What can you do? Chances are that you can use seL4 for an
incremental cyber retrofit.

If the security property you need can be enforced by green-field design with the
right architecture, you likely can gradually restructure the legacy
code base into a more and more secure system. You don't need to reach that
green-field system, you only need to reach an architecture that enforces the
security property.

The first step is to put the complete legacy system into a virtual machine (VM)
running on seL4. This in itself adds no security, only some overhead, but it
serves as a starting point for incremental modularisation.

The next step is to extract and isolate coarse-grained subsystems, moving from a
system with a single VM to one with multiple communicating VMs. For instance, if
you want to protect against network attacks, you might move the network stack
into a separate VM. If there is encryption involved, that could be a separate VM
as well. Now you already have a much stronger system --- a random buffer
overflow in the rest of the code base can no longer be used to subvert the
encryption code, and neither can a code-level attack on the network stack.

<img src="../images/retrofit.png" class="w-full" alt="cyber retrofit">

You could stop here, or repeat this process and refine until you have reached the
level of assurance you require. You can also start removing VMs and replacing
them with faster native seL4 components, or add filters, sanitisers, runtime
checking, monitoring, attestation, and other components into the mix to guard
input and output of legacy code bases.

This process has been used successfully to increase security for multiple
systems. It does not work for all scenarios, but when it works, it shines.

There is a [research article][retro-article] and a [slide set][retro-slides] with
more information on how this works.

## Use seL4 for Mixed Criticality

seL4 is ideally suited for mixed-criticality systems where critical code runs
next to less critical, but maybe performance hungry code on the same system.

You can use seL4's memory isolation for keeping untrusted code in check and
seL4's mixed-criticality scheduling for guaranteeing that untrusted code cannot
deny service to critical components.

## Use seL4 as the basis for your OS

seL4 is a microkernel, it is not an operating system. But you can use it as the
basis for an OS -- that is what it is designed for. There are existing OSes
that do just that: the commercial [KOS from Kry10][KOS] for dynamic
systems and the open-source [LionsOS] from UNSW for static systems.

## Use seL4 for fun and learning

There was a time when it was hard to get started with seL4. No longer.

Fire up [Microkit][devkits] and immediately get going on a simulator, or check
out the [seL4 Dev Kit][devkits] guide on how to get started with hardware.

Use seL4 to hone your embedded systems skills, hack C or Rust code in seL4 user
space, or any of the other [supported languages][languages], write something
cool, tell people about it!


[VMMs]: tools.html#virtualisation
[tools]: tools.html
[retro-article]: https://trustworthy.systems/publications/abstracts/Klein_AKMHF_18.abstract
[retro-slides]: https://trustworthy.systems/publications/papers/Kuz_19.abstract
[LionsOS]: https://lionsos.org/
[KOS]: https://www.kry10.com/#platform
[devkits]: tools.html#devkits
[languages]: tools.html#languages
