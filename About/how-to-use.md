---
SPDX-License-Identifier: CC-BY-SA-4.0
SPDX-FileCopyrightText: 2020 seL4 Project a Series of LF Projects, LLC.
title: How to use seL4
---

- isolation
- trust boundaries
- architecting systems for trust analysis

- filters, sanitisers, authentication, integrity protection, storing secrets

- device drivers, restarting device drivers
- driver VMs

- sandboxing

- native seL4 systems
- fast communication

- seL4 as a hypervisor
- cyber retrofit

- main communication mechanism is async: notifications and share memory
- use endpoints/IPC for protected procedure calls

- context switching in seL4 is seriously fast, you can afford a lot more
  components and protection domains than you think

- leveraging verification
  - verify parts of your system, get properties about the whole system
  - speed up debugging and failure analysis: You know the verified code didn't
    fail, and isolation wasn't broken. This means you can focus your analysis on
    much fewer lines of code when something goes wrong.

- static and dynamic systems
  - most high-assurance systems are static
  - static systems are easier to analyse, because communication channels
    are set up once and the flow of information is predictable
  - formal verification of the initial authority and isolation setup of the
    system coupled with seL4's security theorems gives you strong evidence for
    integrity and data flow boundaries.
  - see Microkit for a simple and principled way to get started with static systems
  - see LionsOS and sDDF for design patterns for fast communication and trust handling

  - dynamic systems are harder to implement, but can react better to changes in the environment
  - see KOS from Kry10 for an example of what dynamic systems on seL4 can achieve
