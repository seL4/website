---
SPDX-License-Identifier: CC-BY-SA-4.0
SPDX-FileCopyrightText: 2020 seL4 Project a Series of LF Projects, LLC.
toc: true
pre: What is seL4?
pre_link: ./
title: Frequently Asked Questions
sub: Questions about seL4 and their answers.
redirect_from: /Info/FAQ/index.html
---

## General Questions

### What is seL4?

seL4 is a high-assurance, high-performance operating system microkernel, unique
because of its [comprehensive formal verification][verification] that sets it
apart from any [other operating system][comparison]. It achieves this without
compromising [performance].  seL4 is open source, available on [GitHub].

seL4 is the most advanced member of the L4 microkernel family.


### What is kernel code vs user-level code?

Kernel code is defined as code running in privileged mode of the hardware, also
known as kernel mode. In contrast, user-level code, or application code, is code
running in unprivileged mode. The kernel of an operating system is defined as
the part of its code that runs in kernel mode.


### What is a microkernel?

A microkernel is the minimal core of an operating system (OS). It presents a
very small subset of what is generally considered an operating system today. The
definition of what makes up a microkernel is given by [Liedtke][SOSP_95]: A
concept is tolerated inside the microkernel only if moving it outside the
kernel, i.e., permitting competing implementations, would prevent the
implementation of the system's required functionality.

A microkernel therefore does not provide high-level abstractions over
the hardware (files, processes, sockets etc) as most modern operating
systems such as Linux or Windows do. Instead, it provides minimal
mechanisms for controlling access to physical address space, interrupts,
and processor time. Any higher-level constructs are built on top of the
microkernel, using those mechanisms. Such higher-level services
inevitably encapsulate policy. Policy-freedom is an important
characteristic of a well-designed microkernel.

In the model used by [L4 microkernels](#what-is-the-l4-microkernel-family) (and
seL4 is no exception), an initial user-level task (the root task) is given full
rights to all resources left over once the kernel has booted up (this typically
includes physical memory, IO ports on x86, and interrupts). It is up to this
root task to set up other tasks, and to grant rights to those other tasks in
order to build a complete system. In seL4, like other third-generation
microkernels, such access rights are conferred by capabilities (unforgeable
tokens representing privileges) and are fully delegatable.


### What is the L4 microkernel family?

L4 is a family of very small,
high-performance microkernels evolved from the first L4 microkernel
developed by Jochen Liedtke in the early '90s. See the
[L4 microkernel family](https://en.wikipedia.org/wiki/L4_microkernel_family) entry on Wikipedia for more details.

A full description of L4 variants and history can be found in the paper ["From
L3 to seL4. What Have We Learnt in 20 Years of L4
Microkernels?"][Elphinstone_Heiser_13].


### How does seL4's performance compare to other microkernels?

Up-to-date performance figures of the seL4 head revision are listed on the
[performance page]({% link performance.html %}). To the best of our knowledge,
seL4 is the world's fastest microkernel on the supported processors, in terms of
the usual ping-pong metric: the cost of a cross-address-space message-passing
(IPC) operation.

In fact, we have not seen performance data from another microkernel
that are within a factor of two of seL4's, and in most cases the
gap is closer to a factor of ten.


### What is the size of seL4?

Obviously this depends on the processor architecture.

In terms of source-code size, the verified 64-bit RISC-V kernel is about 10,000
SLOC (as of Apr'25). The verified AArch32 version is 12,100 SLOC (13,500 SLOC
with hypervisor support), the AArch64 version 12,600 SLOC with hypervisor
support, and the verified configuration of x64 is 16,000 SLOC.

The size of the executable kernel ELF image depends on configuration. It is
about 66 KiB for the default RISC-V 64-bit single-core verified configuration,
141 KiB for AArch32, 162 KiB for AArch64, and 141 KiB for x64.


### I want to know more about seL4 functionality, design, implementation, philosophy

See the [white paper] and the list of [key research papers] about seL4 for more
on seL4 philosophy and design. See the page on [learning material] and the
[docsite] for functionality and API references, and [GitHub] for the sources.


### What can I do with seL4?

You can benefit from [seL4's key differentiators] to build critical systems,
explore a research idea, learn about microkernels, amongst others.

seL4 is general-purpose, so it supports a wide range of application areas. See
its main [intended applications](#what-are-the-intended-applications-of-sel4)
below and examples of [where seL4 is being used in the world][use].

seL4 is also used for [research] and [education].

seL4 is open source, with a liberal license model for user-level code. See the
[license page] for more detail.


### What are the licensing conditions?

The seL4 kernel is released under GPL version 2. User-level tools and libraries
are mostly under BSD-2-Clause, documentation under CC-BY-SA-4.0. The [license
page] has more details.

### How do I contribute to seL4?


See the page on [contribution guidelines]({% link Contribute/index.html %}).


### How do I build a system with seL4?

See the page on [how to use seL4]({% link About/how-to-use.md %}) for scenarios
that benefit from using seL4.

Depending on which of these scenarios you are looking to address, there are
different ways to get started. The [tools and frameworks]({% link tools.html %})
page has frameworks such as Microkit and CAmkES that can help you get started
quickly for static systems, as well as Virtual Machine Monitors, and support
for a number of different programming languages to use on top of seL4.

Note that to build a system from scratch on a microkernel, you will need basic
OS services such as drivers, file system and networking. Some of the tools and
frameworks above help with these. There are also a few ready-made components to
start from in both Microkit and CAmkES, but there is still a lot more
infrastructure work to be done on a microkernel than for developing on a full OS
like a Linux distribution.

For instructions on how get started, see the [Resources] page on the [docsite].
UNSW's [Advanced Operating Systems course](https://www.cse.unsw.edu.au/~cs9242)
has an extensive project component that builds an OS on top of seL4. If you have
access to an [Odroid-C4](https://www.hardkernel.com/shop/odroid-c4/), you should
be able to do the project work yourself as a way of familiarising yourself with
seL4.


### Where can I learn more?

The page on [documentation][learning material] gathers all the pointers to
learning material for seL4, from hands-on tutorials and comprehensive
documentation to research articles and university courses.



## Hardware

### What processor architectures are supported?

Presently seL4 runs on Arm v7 (32-bit) and v8 (64-bit) cores, on PC99 (x86)
cores (32- and 64-bit mode), and RISC-V (32- and 64-bit) cores. See the
up-to-date [platform overview], and detailed [supported platforms] list.

There is a [platform contribution guide] and [platform porting guide] available.


### Which platform ports are verified?

32-bit Arm v7 platforms presently have the [most comprehensive verification
story][verification] (functional correctness to the binary, security proofs,
user-level initialisation proofs). For 64-bit Arm v8 and x86 there are
functional-correctness proofs to C code, and for 64-bit RISC-V there are
functional-correctness proofs to binary code as well as security proofs.

Further verification of the 64-bit Arm v8 configuration (AArch64) is in
progress.

The list of [supported platforms] shows verification status per hardware
platform and the [verified configurations] page has more details on which
platform supports which level of proof.


### What devices does seL4 support?

seL4, like any real microkernel, runs all device drivers in user mode. Device
support is therefore not a kernel matter. The exceptions are a timer
driver, which seL4 needs to enforce time-slice preemption, and the interrupt
controller, to which mediates access. When compiled with debugging enabled,
the kernel also contains a serial driver.

Other than that, device support must be provided by user-level code. seL4
provides the mechanisms for user-mode device drivers, especially the ability to
map device memory to drivers and forward IRQs as (asynchronous) messages.

Check the [Tools, Frameworks & Languages page][tools] for pointers to a device
driver framework and other user-level OS component tools.


### What about DMA?

The formal verification of seL4 assumes that the MMU has complete control over
memory, which means the proof assumes that DMA is off. DMA devices can in theory
overwrite any memory on the machine, including kernel data and code.

You can still use DMA devices safely, but you have to separately assure that
they are well-behaved, that is, that they don't overwrite kernel code or data
structures, and only write to frames allocated to them according to the system
policy. In practice, this means, drivers and hardware for DMA devices need to be
trusted.

There are unverified seL4 configurations with SystemMMU support on Arm and VT-d
extension support for x86. These extensions allow the kernel to restrict DMA and
thereby enable DMA devices with untrusted user-level drivers.


### Does seL4 support multicore?

Multicore is presently supported on x64, ARMv7, ARMv8, and RISC-V. Verification
of the multicore kernel is in progress for static multikernel
configurations in the seL4 [roadmap].

The SMP kernel uses a [big-lock approach, which makes sense for tightly-coupled
cores that share an L2
cache](https://trustworthy.systems/publications/nictaabstracts/Peters_DEH_15.abstract).
It is not meant to scale to many cores, where instead a multikernel is the right
approach -- running a separate kernel image on each core.


### Can I run seL4 on an MMU-less microcontroller?

Using seL4 without a full memory-management unit (MMU) makes little sense, as
its resource management is fundamentally based on virtual memory.


### What are the intended applications of seL4?

seL4 is a general-purpose microkernel, so the answer is all of them. As
explained on the page on [how to use seL4][how-to-use], seL4 can be used as a
fast and secure RTOS, or as a hypervisor, or both, or as a basis for an OS. It
can also be used to architect secure systems, or to cyber retrofit an existing
system.

The main targets are embedded systems with security or reliability requirements,
but that is not exclusive. Using a microkernel like seL4 makes sense on
platforms that provide virtual memory protection and for application areas that
need isolation between different parts of the software. Immediate application
areas are in the financial, medical, automotive, avionics and defence
sectors. See examples of [where seL4 is being used in the world][use].



## Virtual machines

### Can I run Linux on top of seL4?

Yes, seL4 can run Linux in a virtual machine. At present seL4 supports this on
Arm v7 and v8 platforms, as well as x86 (requiring Intel VT-x, ETP and a HPET
that supports MSI delivery).

To support virtual machines, seL4 itself runs as a hypervisor (x86
Ring-0 root mode or ARM hyp mode) and forwards virtualisation events to
a virtual machine monitor (VMM) which performs the necessary emulations.
The VMM runs de-privileged (x86 Ring-3 root mode or ARM supv mode).


### Does seL4 support multiple virtual machines at once?

Yes, multiple VMs are supported, including heterogeneous ones.


### Can I run a real-time OS in a virtual machine on seL4?

In theory, running a real-time OS in a virtual machine on seL4 would be
possible, but in most scenarios it is not recommended because the real-time OS
in the VM would not have much control over time. In general, you will be better
off running real-time applications in a native seL4 environment.

Basic real-time applications, for instance if you are looking to use
standard rate-monotonic scheduling, are directly supported by default seL4
configurations. In addition, the MCS configuration of seL4 has a scheduling
model that supports the kind of temporal isolation that is required for
supporting mixed-criticality systems and goes beyond what most real-time
operating systems can provide. This MCS configuration is mature for single-core
systems, available for use, and currently undergoing verification for functional
correctness. When verification of all security properties on MCS has caught up
with the current default configuration, MCS will become the default for seL4.



## Verification

### What is formal verification?

Formal software verification is the activity of using mathematical proof to show
that a piece of software satisfies specific properties. Traditionally, formal
verification has been widely used to show that the design or a specification of
a piece of software has certain properties, or that a design implements a
specification correctly. In recent years, it has become possible to apply formal
verification directly to the code that implements the software and to show that
this code has specific properties.

There are two broad approaches to formal verification: fully automated methods
that work on limited systems and properties, such as model checking or static
analysis, and interactive mathematical proof which requires manual effort.

The [seL4 verification][proofs] uses formal mathematical proof in the theorem prover
[Isabelle/HOL](http://isabelle.in.tum.de/). This theorem prover is interactive,
but offers a comparatively high degree of automation. It also offers a very high
degree of assurance that the resulting proof is correct.


### What does seL4's formal verification mean?

Unique about seL4 is its unprecedented [degree of assurance][proof-strength],
achieved through formal verification. Specifically, the ARM, ARM\_HYP (ARM with
virtualisation extensions), AARCH64, X64, and RISCV64 configurations of seL4
comprise the first (and still only) general-purpose OS kernel with a full
code-level functional correctness proof -- a mathematical proof that the C
implementation adheres to its specification. In short, the implementation is
proved to be free of implementation defects with respect to the specification.
This also [implies a number of other properties][implications], such as freedom
from buffer overflows, null pointer exceptions, use-after-free, etc.

On the ARM and RISCV64 platforms, there is a further proof that the binary code
which executes on the hardware is a correct translation of the C code. This
means that the compiler does not have to be trusted, and extends the functional
correctness property to the binary.

Furthermore, also on ARM and RISCV64, there are proofs that seL4's
specification, if used properly, will enforce integrity and confidentiality,
which are core security properties. Combined with the proofs mentioned above,
these properties are guaranteed to be enforced not only by a model of the kernel
(the specification) but the actual binary that executes on the hardware.
Therefore, seL4 is the world's first (and still only) OS that is proved secure
in a very strong sense.


### Does seL4 have zero bugs?

The functional correctness proof states that, if the proof assumptions are met,
the seL4 kernel implementation has no deviations from its specification. The
security proofs state that if the kernel is configured according to the proof
assumptions and further hardware assumptions are met, this specification (and
with it the seL4 kernel implementation) enforces a number of strong security
properties: integrity, confidentiality, and availability.

There may still be unexpected features in the specification and one or
more of the assumptions may not apply. The security properties may be
sufficient for what your system needs, but might not. For instance, the
confidentiality proof makes no guarantees about the absence of covert
timing channels.

So the answer to the question depends on what you understand a bug to be. In the
understanding of formal software verification (code implements specification),
the answer is yes, modulo the [proof assumptions][assumptions]. In the
understanding of a general software user, the answer is potentially, because
there may still be hardware bugs or proof assumptions unmet. For high assurance
systems, this is not a problem. It reduces evaluation burden, because analysing
hardware and proof assumptions is much easier than analysing a large software
system, the same hardware, and test assumptions.

To gain a sense of how strong the proofs are, check out the [proofs
page][proof-strength].


### Is seL4 proved secure?

This depends on what you mean by secure. In the interpretation of classic
operating system security, the answer is yes. In particular, seL4 has been
proved to enforce specific security properties, namely integrity and
confidentiality, under certain assumptions. These proofs are very strong
evidence about seL4's utility for building secure systems.

Some of the proof assumptions may appear restrictive, for instance use of DMA is
excluded, or only allowed for trusted drivers that have to be formally verified
by the user. While these restrictions are common for high-assurance systems, we
are working to reduce them, for instance through the use of IOMMUs on x86 or
System MMUs on ARM.


### If I run seL4, is my system secure?

Not automatically, no. Security is a question that spans the whole system,
including its human parts. An OS kernel, verified or not, does not automatically
make a system secure. Any system, no matter how secure, can be used in insecure
ways.

However, if used correctly, seL4 provides the system architect and user with
strong mechanisms to implement security policies, backed by strong security
theorems.


### What are the proof assumptions?

The brief version is: we assume that the few lines of in-kernel assembly code
are correct, hardware behaves correctly, in-kernel hardware management (TLB and
caches) is correct, and boot code is correct. The hardware model assumes DMA to
be off or to be trusted. The security proofs additionally give a list of
conditions how the system is configured.

For a more in-depth description, see the [assumptions page][assumptions].


### How do I leverage seL4's formal proofs?

The seL4 proofs are just the first step in building secure systems. They provide
the tools that application and system developers need for providing evidence
that their systems are secure.

For instance, one can use the functional correctness proof to show that an
application interfaces correctly with the kernel. One can use the integrity
property to show that others can't interfere with private data, and the
confidentiality proof to show that others can't get access to that private data.
And one can tie together all of these into a proof about an entire (one-machine)
system without having to verify the code of the entire system.

If you are interested in connecting to the seL4 proofs for verifying properties
about a product, check out the help available from the [commercial services
page][services].


### Have OS kernels not been verified before?

OS verification goes back at least 40 years to the mid 1970s, so there is plenty
of previous work on verified OS kernels. See also a [comprehensive
overview][Klein_09] paper on OS verification from 2008 as well as the related
work section of the [seL4 overview paper][TOCS_14] from 2014.

The new and exciting thing about seL4 is that it has a) [strong
properties][proofs] such as functional correctness, integrity, and
confidentiality, and b) has these properties formally verified directly to the
code - initially to C, now also to binary. In addition, the seL4 proofs are
machine-checked, not just based on pen and paper.

Previous verifications have either not completed their proofs, have targeted
more shallow properties, such as the absence of undefined execution, or they
have verified manually constructed models of the code instead of the code
itself.

Some of these previous verifications were impressive achievements that laid much
of the groundwork without which the seL4 proofs would not have been achieved. It
is only since around (very roughly) the year 2005 that code verification and
theorem proving technology has advanced enough to make large code-level proofs
feasible.


### When and how often does seL4 get updated and re-proved?

The seL4 proofs are updated continuously, whenever a pull request is merged into
the master branch in the seL4 GitHub repository. You can see the proof updates
coming through on <https://github.com/seL4/l4v/commits/master> and you can see
the kernel revision the proof currently refers to in
<https://github.com/seL4/verification-manifest/blob/master/default.xml>. This is
usually the head of the master branch.


### How do I tell which code in GitHub is covered by the proof and which isn't?

The verification sees the entire C code of the kernel for the particular
combination of configuration options that are selected. See the page on
[verified configurations] for details of architecture and platform
configurations which have verified properties.

Excluded from the verification of the C code is the machine interface and boot
code, whose behaviour is an explicit assumption to the proof.

You can see how verification generates kernel source here in
[l4v/spec/cspec/c/Makefile](https://github.com/seL4/l4v/blob/master/spec/cspec/c/Makefile).
The machine interface are the functions that correspond to the ones in the
Haskell file
[Hardware.lhs](https://github.com/seL4/l4v/blob/master/spec/haskell/src/SEL4/Machine/Hardware.lhs)
and its `Arch` import file.

You can further inspect the gory details by looking at the preprocessor output
in the file `kernel_all.c_pp` in the proof build (or `kernel_all_pp.c` in the
kernel build) - this is what the prover, the proof engineer, and the compiler
see after configuration is done. A quick way of figuring out if something is
in the proof input or not is checking if the contents of that file change if you
make a change to the source you're wondering about. You don't need the prover
for this, and only parts of the seL4 build environment setup. The GitHub CI
setup for seL4 pull requests contains a preprocess check that shows which
verification-relevant code has changed.

The top-level proof makes statements about the behaviour of all of the kernel
entry points, which we enumerate once manually in the proof. The prover reads in
these entry points, and anything that they call must either have a proof or an
assumption for it to complete its proof. If anything is missing, the proof
fails.

That means all of the C code that is in this `kernel_all.c_pp` file either:

- has a proof,
- or has an explicit assumption about it,
- or is never called

The functions with explicit assumptions are the machine interface functions
mentioned above (they're usually inline asm) and the functions that are only
called by the boot process (usually marked with the BOOT_CODE macro in the
source so they're easy to spot).

As an example, the CPU and architecture options mean that everything under
`src/arch/ia32` is not covered by the proof, but that the files in
`src/kernel/object` are.



## Resource management

### How are resources managed and protected in seL4?

The key idea in seL4 is that all resource management is done in user-level
code. Access to and control over resources is controlled by capabilities. The
kernel after boot hands control over all free resources to user-level code, and
after that will never do any memory management itself. It has no heap, just a
few global variables, a strictly bounded stack, and memory explicitly provided
to it by user-level code.


### What are capabilities?

Capabilities are an OS abstraction for managing access rights. A capability
represents "prima facie" evidence of the right to perform a certain operation.
A capability encapsulates an object reference plus access rights.

In a capability system, such as seL4, any operation is authorised by a
capability. When performing an operation on an object (such as sending a message
to an IPC endpoint or stopping a thread) the capability to the object is passed
to the kernel, which then checks whether the capability conveys sufficient
rights to perform the operation, and if yes, performs it with no further
questions asked.

For security, the capabilities themselves are stored in kernel memory (in
CNodes), user mode references them via references to locations CSpace references.

See the wikipedia article on [capability-based
security](https://en.wikipedia.org/wiki/Capability-based_security) for more
details on caps.


### How can user mode manage kernel memory safely?

The kernel puts user-level code in control of system resources. After booting,
the kernel hands all free memory in the form of *Untyped* capabilities to the
first user process, called the *root task*. The root task can then implement
its own resource management policies, e.g. by partitioning the system into
security domains and handing each domain a disjoint subset of Untyped capabilities.

If a system call requires memory for the kernel's metadata, such as the thread
control block when creating a thread, user-level code must provide this memory
explicitly to the kernel. This is done by *retyping* an Untyped capability into
capabilities for the corresponding kernel object type. For instance, for thread
creation, user-level code would retype an Untyped capability into a TCB
capability. The memory pointed to by the TCB capability will then be used by the
kernel to represent thread control blocks. It remains kernel memory in the sense
that only the kernel can read or write it. User-level code can later revoke the
capability, which implicitly destroys the objects (e.g., thread control blocks)
governed by the capability.

The only objects directly accessible by user-level code are *Frames*: These can
be mapped into address spaces (essentially page tables), after which
user-level code can write to the physical memory represented by the Frame
object.


### How can threads communicate?

Communication can happen via message-passing IPC or shared memory. IPC only
makes sense for short messages; there is an implementation-defined,
architecture-dependent limit on the message size of a few hundred bytes, but
generally messages should be kept to a few dozen bytes so that they fit into
registers. For longer messages, a shared buffer should be used.

Depending on the trust relationship, such a buffer may be shared directly
between a pair of threads or groups of threads (some of which may only have
write access, others may only have read access to the buffer). Or the buffer
could be encapsulated in a shared server. Or a trusted server could be given
read access to a sender's buffer and write access to a receiver's buffer and
copies the data directly from the sender's to the receiver's address space.

Shared-buffer access can be synchronised via *Notification* objects.


### How does message-passing work?

As is characteristic to members of the L4 microkernel family, seL4 uses
*synchronous IPC*. This means a rendez-vous communication model, where the
message is exchanged when both sender and receiver are ready. If both are
running on the same core, this means that one partner will block until the other
invokes the IPC operation.

In seL4, IPC is via *Endpoint* objects. An Endpoint can be considered a mailbox
through which the sender and receiver exchange the message through a handshake.
Anyone holding a capability with *Send* rights to the Endpoint can send a
message through that Endpoint, and anyone holding a capability with *Receive*
rights can receive a message on the Endpoint the capability refers to. This
means that there can be any number of sender and receivers for each Endpoint. In
particular, a specific message is only delivered to one receiver (the first in
the queue), no matter how many threads are trying to receive from the Endpoint.

Message broadcast is a higher-level abstraction that can be implemented
on top of seL4's primitive mechanisms.


### Why do send-only operations not return a success indication?

The send-only IPC system calls `seL4_Send()` and `seL4_NBSend()`
can be invoked with a send-only capability, enabling one-way data
transfer. By definition, a send-ony cap cannot be used to receive any
information. A result status, indicating whether or not the message has
been delivered, would constitute a back channel: the receiver could use
the result status to signal information to the sender.

In short, it's a feature.

But also note that [you should use send-only and receive-only IPC only for
initialisation and exception
handling](https://microkerneldude.wordpress.com/2019/03/07/how-to-and-how-not-to-use-sel4-ipc/).
The normal pattern is that of a protected procedure call, i.e. invoking a
function in a different protection domain, where the caller uses `seL4_Call()`
and the receiver uses `seL4_Reply_Wait()` invocations, which combine sending and
receiving in a single system call.

`seL4_Send()` and `seL4_NBSend()` are primarily meant for Notification objects
where one-way communication can be used to implement unidirectional information
flow policies.


### What are Notifications?

A *Notification* object is logically a small array of binary semaphores. It has
the same operations: `Signal` and `Wait`. Due to the binary nature, multiple
`Signal` operations may be lost if they are not interleaved with `Wait`.

Signalling a Notification requires a capability with Send right to the
Notification object. The capability has a *badge*, which is a bit pattern set by
the creator of the cap, typically the owner of the Notification object. The
`Signal` operation bitwise ORs the badge on the Notification's bit array. The
`Wait` operation blocks until the array is non-zero, and then returns the bit
string and zeros out the array.

Notifications can also be polled, which is like `Wait`, except the operation
does not block, and instead returns zero immediately, even if the Notification
bit string is zero.


### What is the seL4 fast path?

The fast path is an add-on frontend to the kernel which performs the simple cases
of some common operations quickly. It is key to the high IPC performance seL4
achieves -- we know of no kernel that does IPC faster.

Enabling or disabling the fast path should not have any impact on the kernel
behaviour except for performance. On verified configurations that include the
fast path, this property is part of the proof.

There is a section on the fast path and its verification in [this
article][TOCS_14]. The fast path discussion starts on page 23.


## What's coming up next?

There are always new things in the pipeline for seL4. See the [roadmap]
for what is up next.


[verification]: {% link Verification/index.html %}
[proofs]: {% link Verification/proofs.html %}
[proof-strength]: ../Verification/proofs.html#strength
[implications]: {% link Verification/implications.html %}
[performance]: {% link performance.html %}

[roadmap]: {% link roadmap.html %}

[GitHub]: https://github.com/seL4/seL4
[docsite]: https://docs.sel4.systems
[Resources]: https://docs.sel4.systems/Resources
[verified configurations]: https://docs.sel4.systems/projects/sel4/verified-configurations.html

[white paper]: {% link About/whitepaper.md %}
[learning material]: {% link Learn/index.html %}
[key research papers]: {% link Research/publications.html %}
[license page]: {% link Legal/index.html %}
[assumptions]: {% link Verification/assumptions.html %}

[platform porting guide]: https://docs.sel4.systems/projects/sel4/porting
[platform contribution guide]: {% link Contribute/platform-ports.md %}

[platform overview]: {% link platforms.html %}
[supported platforms]: https://docs.sel4.systems/Hardware/

[TOCS_14]: {% link Research/pdfs/comprehensive-formal-verification-os-microkernel.pdf %}
[Elphinstone_Heiser_13]: https://trustworthy.systems/publications/nictaabstracts/Elphinstone_Heiser_13.abstract

[Klein_09]: https://trustworthy.systems/publications/nictaabstracts/Klein_09.abstract
[SOSP_95]: https://dl.acm.org/doi/10.1145/224056.224075

[research]: {% link Research/index.html %}
[education]: {% link Research/courses.html %}
[use]: {% link use.html %}
[seL4's key differentiators]:  {% link About/fact-sheet.html %}
[comparison]:  {% link About/comparison.html %}
[tools]:  {% link tools.html %}
[how-to-use]:  {% link About/how-to-use.md %}
[services]: {% link Services/index.html %}
