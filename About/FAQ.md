---
SPDX-License-Identifier: CC-BY-SA-4.0
SPDX-FileCopyrightText: 2020 seL4 Project a Series of LF Projects, LLC.
toc: true
pre: What is seL4?
pre_link: ./
title: Frequently Asked Questions
sub: Questions about seL4 and their answers.
---

## General Questions

### What is seL4?

seL4 is the most advanced member of the L4 microkernel family, notable for its
comprehensive formal verification, which sets it apart from any other operating
system. seL4 achieves this without compromising performance.

### What is a microkernel?

<!-- FIXME: cites should be links or have actual bib -->

A microkernel is the minimal core of an operating system (OS). It presents a
very small subset of what is generally considered an operating system today. The
definition of what makes up a microkernel is given by Liedtke [SOSP'95]: A
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

In the model used by L4 microkernels (and seL4 is no exception), an
initial user-level task (the root task) is given full rights to all
resources left over once the kernel has booted up (this typically
includes physical memory, IO ports on x86, and interrupts). It is up to
this root task to set up other tasks, and to grant rights to those other
tasks in order to build a complete system. In seL4, like other
third-generation microkernels, such access rights are conferred by
capabilities (unforgeable tokens representing privileges) and are fully
delegatable.

### What is the L4 microkernel family?

L4 is a family of very small,
high-performance microkernels evolved from the first L4 microkernel
developed by Jochen Liedtke in the early '90s. See the
[L4 microkernel family](https://en.wikipedia.org/wiki/L4_microkernel_family) entry on Wikipedia for more details.

<img style="width:100%" src="https://sel4.systems/images/l4family.svg" alt="L4 microkernel family tree" aria-describedby="p1"/>

<p id="p1">
L4 microkernel family tree from 1993 until 2013. Black arrows indicate code,
green arrows ABI inheritance. Node colours indicate author organisations. A full
description of L4 variants and history can be found along this image source:
"From L3 to seL4. What Have We Learnt in 20 Years of L4 Microkernels?
[Elphinstone & Heiser, SOSP 2013]"
</p>


### How does seL4's performance compare to other microkernels?

Up-to-date performance figures of the seL4 head revision are listed on the [seL4
Benchmarks page]({% link About/Performance/index.html %}). To the best of our
knowledge, seL4 is the world's fastest microkernel on the supported processors,
in terms of the usual ping-pong metric: the cost of a cross-address-space
message-passing (IPC) operation.

In fact, we have not seen performance data from another microkernel
that are within a factor of two of seL4's, and in most cases the
gap is closer to a factor of ten.

### What is the size of seL4?

Obviously this depends on the processor architecture.

In terms of source-code size, the 64-bit RISC-V kernel is about 9,400 SLOC (as
of Jan'20). The Arm version is similar, x64 is larger (16-18 kSLOC) due to the
more complex platform, the extra code is mostly in the kernel initialisation.

In terms of executable code size, on the 64-bit RISC-V architecture, the
single-core kernel compiles into about 138 KiB. Its RAM size is about 162 KiB,
which includes code, static data and the stack. Meta-data for user mode
processes, including address spaces (page tables), thread-control blocks,
capability storage etc, will add to this. (But note that in seL4's
memory-management model, such dynamic memory must be supplied to the kernel by
user mode code.)

### I want to know more about seL4 functionality, design, implementation, philosophy

See the [white paper] and the list of [key research papers] about seL4 for more
on seL4 philosophy and design. See the page on [learning material] and the
[docsite] for functionality and API references, and [GitHub] for the sources.

### What can I do with seL4?

You can use seL4 for research, education or commerce. seL4 is open source, with
a liberal license model for user-level code. See the [license page] for more
detail.

<!-- FIXME: probably should say more about what you can actually do with it -->

### What are the licensing conditions?

The seL4 kernel is released under GPL version 2. Userland tools and libraries
are mostly under BSD-2-Clause, documentation under CC-BY-SA-4.0. The [license
page] has more details.

### How do I contribute to seL4?

See the page on [contribution guidelines]({% link Contribute/index.html %}).

### How can I build a system with seL4?

<!-- FIXME: update; add microkit -->

Much more is required to build a system on seL4 compared to building on, say
Linux. Having decomposed your system into modules, you will need to work out
what access each module needs to hardware resources, you will need to build
device drivers for the platform you are on (there are a few provided in
`libplatsupport` for supported platforms), and you will have to integrate it
into something that can be run.

There are two recommended ways to do this.

- [CAmKES](https://docs.sel4.systems/projects/camkes/) is the
      Component Architecture for Micro-Kernel-based Embedded Systems. It
      provides a language for describing the distribution of resources
      to components, and the assignment of components to address spaces.
- Build on `libsel4utils`, which provides useful abstractions like
      processes, but is generally more low-level.

For build instructions, and how to get started, see the [Resources] page on the
[docsite]. Also, UNSW's [Advanced Operating Systems
course](https://www.cse.unsw.edu.au/~cs9242) has an extensive project component
that builds an OS on top of seL4. If you have access to an
[Odroid-C4](https://www.hardkernel.com/shop/odroid-c4/), you should be able to
do the project work yourself as a way of familiarising yourself with seL4.

### Where can I learn more?

<!-- FIXME: also update with in-site links -->

The UNSW [seL4 project](https://trustworthy.systems/projects/seL4/) and
[Trustworthy Systems](https://trustworthy.systems/) pages contain more technical
information about seL4, including links to all peer-reviewed publications. Good
starting points are:

- [from L3 to seL4 – what have we learnt in 20 years of L4
  microkernels?][Elphinstone_Heiser_13], a 20-year retrospective of L4
  microkernels;
- [the original 2009 paper][SOSP_09] describing seL4 and its formal verification;
- [a much longer paper detailing the complete verification story of seL4][TOCS_14],
  including the high-level security proofs, binary verification
  and timeliness analysis. It also contains an analysis of the cost of
  verification, and how it compares to that of traditionally-engineered
  systems.

## Hardware

### What processor architectures are supported?

Presently seL4 runs on Arm v7 (32-bit) and v8 (64-bit) cores, on PC99 (x86)
cores (32- and 64-bit mode), and RISC-V RV64 (64-bit) cores. See the up-to-date
list of [supported platforms].

<!-- FIXME: link to platform contribution page instead -->
Talk to us if you have funds to support a port to further architectures.

### Which platform ports are verified?

We have presently the most comprehensive verification story (functional
correctness to the binary, security proofs, user-level initialisation proofs)
for 32-bit Arm v7 platforms. For 64-bit Arm v8 and x86 there are
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
of the multicore kernel is in progress for static multikernel configurations.

The SMP kernel uses a [big-lock approach, which makes sense for tightly-coupled
cores that share an L2
cache](https://trustworthy.systems/publications/nictaabstracts/Peters_DEH_15.abstract).
It is not meant to scale to many cores, where instead a multikernel is the right
approach -- running a separate kernel image on each core.

### Can I run seL4 on an MMU-less microcontroller?

Using seL4 without a full memory-management unit (MMU) makes little sense, as
its resource management is fundamentally based on virtual memory. For lower-end
processors that only have a memory-protection unit (MPU) or no memory protection
at all, you should look at the [eChronos real-time operating
system](https://trustworthy.systems/projects/OLD/echronos/), which is
designed for such processors and has undergone partial formal verification.

### What are the intended applications of seL4?

seL4 is a general-purpose microkernel, so the answer is all of them. The main
targets are embedded systems with security or reliability requirements, but that
is not exclusive. Using a microkernel like seL4 makes sense on platforms that
provide virtual memory protection and for application areas that need isolation
between different parts of the software. Immediate application areas are in the
financial, medical, automotive, avionics and defence sectors.

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

<!-- FIXME: update. Some parts misleading; who is "we"; MCS no longer new.
     "Mainline" is no longer a concept. "We" do not recommend using MCS
     for all new projects. -->
seL4 is the world’s only hypervisor with a sound worst-case execution-time
(WCET) analysis, and as such the only one that can give you actual real-time
guarantees, no matter what others may be claiming. (If someone else tells you
they can make such guarantees, ask them to make them in public so Gernot can
call out their bullshit.)

The originally published analysis was performed on an earlier version of the
kernel, and contained unverified improvements. We have recently improved our
WCET analysis to make the determination of loop bounds and infeasible paths
high-assurance. We now also apply it to the verified kernel, so this now also
has sound execution-time bounds. Unfortunately, we can only do a sound analysis
on relatively dated processor cores (ARM11, which is an ARMv6 core) as ARM no
longer publishes latency bounds for instructions. We should be able to repeat
this for open RISC-V processor implementations, stay tuned.

We are actually not convinced that running an RTOS in a VM is necessarily the
way to go, although that somewhat depends on your circumstances. In general,
you’ll better off running RT apps in a native seL4 environment.

More importantly, we have developed a new scheduling model that supports the
kind of temporal isolation that is required for supporting mixed-criticality
systems. This MCS model is presently in verification and is being merged into
mainline as verification progresses We strongly recommend basing any new project
on the MCS model, irrespective of whether it requires real-time properties.

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
such as model checking that work on limited systems and properties, and
interactive mathematical proof which requires manual effort.

The seL4 verification uses formal mathematical proof in the theorem prover
[Isabelle/HOL](http://isabelle.in.tum.de/). This theorem prover is interactive,
but offers a comparatively high degree of automation. It also offers a very high
degree of assurance that the resulting proof is correct.

### What does seL4's formal verification mean?

Unique about seL4 is its unprecedented degree of assurance, achieved through
formal verification. Specifically, the ARM, ARM\_HYP (ARM with virtualisation
extensions), AARCH64, X64, and RISCV64 versions of seL4 comprise the first (and
still only) general-purpose OS kernel with a full code-level functional
correctness proof, meaning a mathematical proof that the implementation (written
in C) adheres to its specification. In short, the implementation is proved to be
free of implementation defects. This also implies a number of other properties,
such as freedom from buffer overflows, null pointer exceptions, use-after-free,
etc.

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

<!-- FIXME: misleading, Arm v6 no longer supported -->
Finally, seL4 for Arm v6 was the first (and still only) protected-mode OS
kernel with a sound and complete timeliness analysis. Among others this means
that it has provable upper bounds on interrupt latencies (as well as latencies
of any other kernel operations). It is therefore the only kernel with memory
protection that can give you hard real-time guarantees.

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
the answer is yes. In the understanding of a general software user, the answer
is potentially, because there may still be hardware bugs or proof assumptions
unmet. For high assurance systems, this is not a problem. It reduces evaluation
burden, because analysing hardware and proof assumptions is much easier than
analysing a large software system, the same hardware, and test assumptions.

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

For a more in-depth description, see the [proof and assumptions page][proofs].

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

If you are interested in connecting to the seL4 proofs, let us know, as we may
be able to offer assistance.

### Have OS kernels not been verified before?

OS verification goes back at least 40 years to the mid 1970s, so there is plenty
of previous work on verified OS kernels. See also a [comprehensive
overview][Klein_09] paper on OS verification from 2008 as well as the related
work section of the [seL4 overview paper][TOCS_14] from 2014.

The new and exciting thing about seL4 is that it has a) strong properties such
as functional correctness, integrity, and confidentiality, and b) has these
properties formally verified directly to the code - initially to C, now also to
binary. In addition, the seL4 proofs are machine-checked, not just based on pen
and paper.

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

We update the seL4 proofs semi-continuously, usually whenever a pull request is
merged into the master branch in the seL4 GitHub repository. You can see the
proof updates coming through on <https://github.com/seL4/l4v/commits/master> and
you can see the kernel revision the proof currently refers to in
<https://github.com/seL4/verification-manifest/blob/master/default.xml>. This is
usually the head of the master branch.

The frequency depends on what it is and who has time. Larger features take
longer to write and prove and get pushed when they are done. Not many of these
happen per year unless there is specific funding for a specific feature. Small
updates take a day to a few weeks.

### How do I tell which code in GitHub is covered by the proof and which isn't?

The verification sees the entire C code for one particular combination of
configuration options. See the page on [verified configurations] for details of
architecture and platform configurations which have verified properties.

Excluded from the verification of the C code is the machine interface and boot
code, whose behaviour is an explicit assumption to the proof.

You can see how verification generates kernel source here in
[l4v/spec/cspec/c/Makefile](https://github.com/seL4/l4v/blob/master/spec/cspec/c/Makefile).
The machine interface are the functions that correspond to the ones in the
Haskell file
[Hardware.lhs](https://github.com/seL4/l4v/blob/master/spec/haskell/src/SEL4/Machine/Hardware.lhs).

You can further inspect the gory details by looking at the preprocessor output
in the file `kernel_all.c_pp` in the proof build (or `kernel_all_pp.c` in the
kernel build) - this is what the prover, the proof engineer, and the compiler
see after configuration is done. So a quick way of figuring out if something is
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
- or is not part of the kernel (i.e. is never called)

The functions with explicit assumptions are the machine interface functions
mentioned above (they're usually inline asm) and the functions that are only
called by the boot process (usually marked with the BOOT_CODE macro in the
source so they're easy to spot).

As an example, the CPU and architecture options mean that everything under
`src/arch/ia32` is not covered by the proof, but that the files in
`src/kernel/object` are.


## Resource management

### How are resources managed and protected in seL4?

<!-- FIXME: remove userland; not a word -->
The key idea in seL4 is that all resource management is done in userland. Access
to and control over resources is controlled by capabilities. The kernel after
boot hands control over all free resources to userland, and after that will
never do any memory management itself. It has no heap, just a few global
variables, a strictly bounded stack, and memory explicitly provided to it by
userland.

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

<!-- FIXME: update, confuses memory with caps -->
<!-- FIXME: clean up double quote style -->
The kernel puts userland in control of system resources by handing all
free memory (called "Untyped") after booting to the first user process
(called the "root task") by depositing the respective caps in the root
tasks's CSpace. The root task can then implement its resource management
policies, e.g. by partitioning the system into security domains and
handing each domain a disjoint subset of Untyped memory.

If a system call requires memory for the kernel's metadata, such as the
thread control block when creating a thread, userland must provide this
memory explicitly to the kernel. This is done by "retyping" some
Untyped memory into the corresponding kernel object type. Eg. for thread
creation, userland must retype some Untyped into "TCB Objects". This
memory then becomes kernel memory, in the sense that only the kernel can
read or write it. Userland can still revoke it, which implicitly
destroys the objects (e.g., threads) represented by the object.

The only objects directly accessible by userland are "Frame Objects":
These can be mapped into an "Address Space Object" (essentially a page
table), after which userland can write to the physical memory
represented by the Frame Objects.

### How can threads communicate?

Communication can happen via message-passing IPC or shared memory. IPC only
makes sense for short messages; there is an implementation-defined,
architecture-dependent limit on the message size of a few hundred bytes, but
generally messages should be kept to a few dozen bytes. For longer messages, a
shared buffer should be used.

Depending on the trust relationship, such a buffer may be shared directly
between a pair of threads or groups of threads (some of which may only have
write access, others may only have read access to the buffer). Or the buffer
could be encapsulated in a shared server. Or a trusted server could be given
read access to a sender's buffer and write access to a receiver's buffer and
copies the data directly from the sender's to the receiver's address space.

Shared-buffer access can be synchronised via "Notifications".

### How does message-passing work?

As is characteristic to members of the L4 microkernel family, seL4 uses
"synchronous IPC". This means a rendez-vous communication model, where the
message is exchanged when both sender and receiver are ready. If both are
running on the same core, this means that one partner will block until the other
invokes the IPC operation.

In seL4, IPC is via "Endpoint Objects". An Endpoint can be considered a mailbox
through which the sender and receiver exchange the message through a handshake.
Anyone holding a Send capability can send a message through an Endpoint, and
anyone holding a Receive cap can receive a message. This means that there can be
any number of sender and receivers for each Endpoint. In particular, a specific
message is only delivered to one receiver (the first in the queue), no matter
how many threads are trying to receive from the Endpoint.

Message broadcast is a higher-level abstraction that can be implemented
on top of seL4's primitive mechanisms.

### Why do send-only operations not return a success indication?

The send-only IPC system calls `seL4_Send()` and `seL4_NBSend()`
can be invoked with a send-only capability, enabling one-way data
transfer. By definition, a send-ony cap cannot be used to receive any
information. A result status, indicating whether or not the message has
been delivered, would constitute a back channel: the receiver could use
the result status to signal information to the sender.

In short, it's a feature, not a bug (painful as it may be).

But also note that, unless you're building things like data diodes, [you should
use send-only and receive-only IPC only for initialisation and exception
handling](https://microkerneldude.wordpress.com/2019/03/07/how-to-and-how-not-to-use-sel4-ipc/).
The normal pattern is that of a protected procedure call (i.e. invoking a
function in a different protection domain), where the caller uses "seL4_Call()"
and the receiver uses "seL4_Reply_Wait()" invocations, which combine sending and
receiving in a single system call.

### What are Notifications?

A "Notification Object" is logically a small array of binary semaphores. It has
the same operations: "Signal" and "Wait". Due to the binary nature, multiple
Signals may be lost if they are not interleaved with Waits.

Signalling a Notification requires a Send cap on the Notification Object. The
cap has a "Badge", which is a bit pattern set by the creator of the cap
(typically the owner of the Notification Object). The Signal operation bitwise
ORs the badge on the Notification's bit array. The Wait operation blocks until
the array is non-zero, and then returns the bit string and zeros out the array.

Notifications can also be "Polled", which is like Wait, except the operation
does not block, and instead returns zero immediately, even if the Notification
bit string is zero.

### What is the seL4 fastpath?

<!-- FIXME: fast path instead of fastpath? -->

The fastpath is an add-on frontend to the kernel which performs the simple cases
of some common operations quickly. It is key to the high IPC performance seL4
achieves -- we know of no kernel that does IPC faster.

Enabling or disabling the fastpath should not have any impact on the kernel
behaviour except for performance.

There is a section on the fastpath and its verification in [this
article][TOCS_14]. The fastpath discussion starts on page 23.

## What's coming up next?

<!-- FIXME: link to roadmap page instead when it exists -->

We're currently working on a number of things. As we're in a research
environment (not a product development environment) we cannot commit to dates,
or the order in which any of these will be delivered (or even if they will be
released at all).

That being said, we are currently working on:

- verification of the AArch64 kernel
- verification of multicore seL4
- [time protection] as a principled prevention of timing channels (this one is
  still very much cutting-edge research)


[GitHub]: https://github.com/seL4/seL4
[docsite]: https://docs.sel4.systems
[Resources]: https://docs.sel4.systems/Resources
[verified configurations]: https://docs.sel4.systems/projects/sel4/verified-configurations.html

[white paper]: {% link About/whitepaper.md %}
[learning material]: {% link Learn/index.html %}
[key research papers]: {% link Research/publications.html %}
[license page]: {% link Foundation/Trademark/license-tm.html %}
[proofs]: {% link Info/FAQ/proof.html %}

<!-- FIXME: use on-site page when it exists -->
[supported platforms]: https://docs.sel4.systems/Hardware/

<!-- FIXME: links to PDFs or paper section on sel4.systems? -->
[time protection]: https://trustworthy.systems/publications/csiroabstracts/Ge_YCH_19.abstract?bib=combined
[TOCS_14]: https://trustworthy.systems/publications/nictaabstracts/Klein_AEMSKH_14.abstract
[SOSP_09]: https://trustworthy.systems/publications/nictaabstracts/Klein_EHACDEEKNSTW_09.abstract
[Elphinstone_Heiser_13]: https://trustworthy.systems/publications/nictaabstracts/Elphinstone_Heiser_13.abstract

[Klein_09]: https://trustworthy.systems/publications/nictaabstracts/Klein_09.abstract
