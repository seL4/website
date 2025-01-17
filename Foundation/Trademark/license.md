---
SPDX-License-Identifier: CC-BY-SA-4.0
SPDX-FileCopyrightText: 2020 seL4 Project a Series of LF Projects, LLC.
title: seL4 Licensing
pre: Licensing and Trademark
pre_link: license-tm.html
sub: '
  <p>
    The seL4 kernel is open source and licensed under the GPL, version 2.
  </p>
  <p class="mt-1 a-underline">
    The GPL propagation clause
    stops at the user code boundary. This means, user code, operating system code,
    and drivers can have any license, proprietary or open source.
    This page explains the <a href="#licensing-model">licensing model</a>,
    the <a href="#why-gpl">motivation</a> behind it, and
    the <a href="#license-details">details</a>
    which open-source licenses are used by the seL4 Foundation.
  </p>
  '
---

## Licensing Model

The seL4 kernel itself is licensed under [GPL version 2][GPL-2.0-only], like
Linux.

The GPL is one of the most popular open-source licenses, upheld in court in the
US and other countries. One of its stipulations is that changes and "derived
code" must again be licensed under the GPL.

As with Linux, this GPL stipulation stops at the kernel/user boundary:
user-level code can have any license and can also be closed-source. Unlike for
Linux -- because seL4 is a microkernel -- the actual operating system, including
drivers, runs in user level on top of seL4.

This means, the licensing model is more flexible than for Linux or for most
commercial operating systems. You can develop a closed-source commercial OS or
system on top of seL4 without fear of violating the GPL. You can also develop a
fully open source OS or system on top of seL4 with an even more liberal license.

<img src="/images/licensing.drawio.svg" class="w-full px-2"
     alt="Diagram with seL4 (GPL) at the bottom,
          system code and drivers (any license) +
          optional foundation frameworks (BSD) in the middle, and
          user-code (any license) at the top.)">

Only if you change seL4 itself or the seL4 proofs, your changes fall under the
conditions of the GPL. For normal system development, this should not be
necessary. Even then it would only affect a very small
portion of the overall system -- much less than if you were using Linux or if
you were paying license fees for a commercial OS where such changes would
usually be impossible.

## Why GPL?

The motivation for this licensing model was to keep seL4 strongly open-source
and to encourage changes to be contributed back instead of creating a
proliferation of forks or slightly changed seL4 versions.

Note that the license does allow you to make a fork of seL4 and distribute a
changed version of seL4 under the GPL, but the [seL4 trademark] policy prohibits
you from calling that changed version "seL4". This is to provide clarity which
code base the trade mark seL4 refers to and that the high assurance of seL4 is
not compromised by third-party changes.

## License Details

The code and documentation in the repositories of the [seL4 GitHub
organisation][seL4-org] are available under standard open-source licenses,
identified by [SPDX license tags][SPDX].

The seL4 Foundation licenses and accepts contributions for

- the seL4 kernel itself under [GPL Version 2][GPL-2.0-only],
- user code and proof libraries under the [BSD 2 Clause license][BSD-2-Clause],
- code and proofs that depend on GPL-code or GPL-proofs under GPL,
- documentation under [Creative Commons Attribution-ShareAlike][CC-BY-SA-4.0].

As in the [Linux syscall note for the GPL][GPL-note], the seL4 kernel GPL
license explicitly does *not* cover user-level code that uses kernel services by
normal system calls -- this is merely considered normal use of the kernel, and
does *not* fall under the heading of "derived work". Syscall headers are
provided under BSD. You can create, distribute and commercially develop systems
on top of seL4 without fear of GPL infection from seL4.

The repositories of the seL4 GitHub organisation also contain third-party code
under additional compatible open source licenses. See the individual file
headers for details, or use one of the publicly available [SPDX] tools to
generate a software bill of materials. The directory `LICENSES/` in each
repository contains the text for all licenses that are mentioned by files in
that repository.


[seL4-org]: https://github.com/seL4/
[GPL-2.0-only]: https://spdx.org/licenses/GPL-2.0-only.html
[BSD-2-Clause]: https://spdx.org/licenses/BSD-2-Clause.html
[CC-BY-SA-4.0]: https://spdx.org/licenses/CC-BY-SA-4.0.html
[SPDX]: https://spdx.org
[GPL-note]: https://spdx.org/licenses/Linux-syscall-note.html
[seL4 trademark]: ./index.html
