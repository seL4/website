---
SPDX-License-Identifier: CC-BY-SA-4.0
SPDX-FileCopyrightText: 2020 seL4 Project a Series of LF Projects, LLC.
pre: Contributing to seL4
pre_link: ./
title: Platform Contributions
sub: "How to contribute a platform port and what it means
      to be a long-term platform maintainer."
img: /images/tries-shutterstock/stock-photo-collection-of-different-types-of-embedded-cpu-modules-with-integrated-chips-and-connectors-2452627321.jpg
img_alt: "Collection of different types of embedded CPU modules"
---

While it is exciting to see seL4 running on as many platforms as possible,
maintaining, testing, and validating the formal verification on those platforms
has an ongoing cost, and for instance an incomplete platform port would lead to
a very frustrating user experience.

The [Technical Steering Committee][TSC] has therefore set the following requirements
and expectations for seL4 platform ports.

## Platform port requirements

For a platform port to be accepted, it should:

- follow the [contribution guidelines] and [coding standards] of the seL4 kernel;
- pass the `sel4test` and `sel4bench` test suites;
- come with documentation on the [seL4 docsite][docsite] and corresponding updates to the
  list of [supported platforms];
- ideally come with hardware that the seL4 Foundation can use for continuous
  integration testing.

Passing `sel4test` and `sel4bench` often requires a rudimentary user-level timer
driver and serial driver. A platform port within an architecture that is already
supported by seL4 usually does not need to go through the RFC process. A set of
pull requests to the kernel, `sel4test`, `sel4bench`, and the docsite usually
suffices.

See also the [platform porting guidelines] on the seL4 docsite. If you require
seL4 on a new platform and do not want to port and contribute it yourself, one
of the [commercial service providers] in the seL4 Foundation may be able to
help.

[contribution guidelines]: {% link Contribute/index.html %}
[coding standards]: {% link Contribute/conventions.html %}
[platform porting guidelines]: https://docs.sel4.systems/projects/sel4/porting
[commercial service providers]: {% link Foundation/Services/index.html %}
[TSC]: {% link Foundation/TSC/index.html %}
[docsite]: https://docs.sel4.systems

## Platform owners

Sometimes longer-term maintenance of a platform does not sit with the seL4
Foundation, but with the original contributor of the platform or another
volunteer with an interest in longer-term support for that platform. They are
acknowledged and named on the list of [supported platforms].

The expectation is that a platform owner

- is the maintainer of platform-specific kernel and library code for that
  platform;

- is the “driver” for that platform, setting the direction where things are
  going for the platform;

- has the following **responsibilities**:

  - keep the platform working, make sure `sel4test` and `sel4bench` are passing
    on the master branch for all supported configurations, especially for MCS,
    but also multicore, and hyp/IOMMU where relevant.
  - write and maintain documentation for the platform.
  - help to keep the verification passing for verified configurations.
  - handle bug reports for that platform on GitHub and development mailing list.
  - handle support requests/questions for that platform.
  - review and help merge PRs for that platform. Relevant PRs should have one
    approving review from the platform owner if possible.
  - if possible providing binaries for bootloader and load instructions.
  - if other development on the master branch has platform impact, it should
    preferably include relevant platform code updates already, but might need
    consultation with the platform owner to get done, i.e. the basic expectation
    would be “you break it, you fix it”, but people sometimes might need help.

If this looks like a long list -- this is only a small fraction of the
maintenance the seL4 Foundation usually provides to the community. Luckily, most of
the time seL4 maintenance does not require much action from platform owners once
everything is set up and working.

[supported platforms]: https://docs.sel4.systems/Hardware/
