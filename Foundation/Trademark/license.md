---
SPDX-License-Identifier: CC-BY-SA-4.0
SPDX-FileCopyrightText: 2020 seL4 Project a Series of LF Projects, LLC.
title: seL4 Licensing
pre: Licensing and Trademark
pre_link: license-tm.html
sub: '
  <p class="a-underline">
    The seL4 kernel itself is open source and licensed under the GPL, version 2.
    Application code, operating system components, and drivers can have
    any license, proprietary or open source, that is, the GPL propagation
    clause of the kernel license stops at the kernel/user code boundary.  This page
    explains the <a href="#licensing-model">licensing model</a>, the <a
    href="#why-gpl">motivation</a> behind it, and the <a
    href="#license-details">details</a> of all open-source licenses used for
    code provided by the seL4 Foundation.
  </p>
  '
---

## Licensing Model

The seL4 kernel itself is licensed under [GPL version 2][GPL-2.0-only], like
Linux. The seL4 Foundation also licenses other frameworks under various
more liberal licenses, as explained [further below](#license-details).

The GPL is one of the most popular open-source licenses. One of its stipulations
is that changes and "derived code" must again be licensed under the GPL. We
explain [further below](#why-gpl) why this is important to ensure adoption and
longevity.

As with Linux, this GPL stipulation stops at the kernel/user boundary. This
means that the GPL only applies to kernel code, which is defined as the code
running in privileged mode of the hardware. In contrast, user-level code ---
code running in unprivileged mode --- can have any license and can also be
closed-source. Unlike Linux, because seL4 is a microkernel, the actual operating
system, including drivers, runs as user code on top of seL4. This implies that
the licensing model for seL4 is more flexible than for Linux or for most
commercial operating systems. You can develop a closed-source commercial OS or
system on top of seL4 without fear of violating the GPL. You can also develop a
fully open-source OS or system on top of seL4 with an even more liberal license
than GPL, such as the BSD-licensed frameworks that are also provided by the seL4
Foundation.

It is only if you change the seL4 kernel code itself or the seL4 kernel proofs
that your changes fall under the conditions of the GPL. However, for normal
system development you should not have to change any kernel code. This would
invalidate the seL4 proofs, which is one of seL4’s key values, and shouldn’t be
necessary. The exception to this is a new platform port of seL4. Even then, the
change would apply to only a small part of the hardware IP (mostly timer and
interrupt controller) and would only affect a very small portion of the overall
system -- much less than if you were using Linux or if you were paying license
fees for a commercial OS where such changes would usually be impossible.

{% svg images/licensing.drawio.svg class="w-full px-2" %}
<!-- FIXME  alt="Diagram with seL4 (GPL) at the bottom,
          system code and drivers (any license) +
          optional foundation frameworks (BSD) in the middle, and
          user-code (any license) at the top.)" -->

{% include right-up-button.html %}


## Why GPL?

The motivation for this licensing model is to keep seL4 strongly open-source,
for wider adoption, and to encourage changes to be contributed back instead of
creating a proliferation of forks or slightly changed seL4 versions.

Note that the license does allow you to make a fork of seL4 and distribute a
modified version under the GPL, but the [seL4 trademark] policy prohibits you
from calling that modified version "seL4". This restriction is crucial for
maintaining clarity around which codebase the seL4 trademark refers to, and
for ensuring that the high assurance of seL4 is not compromised by third-party
changes.

{% include right-up-button.html %}


## License Details

The code and documentation in the repositories of the [seL4 GitHub
organisation][seL4-org] are available under standard open-source licenses,
identified by [SPDX license tags][SPDX] in the header of each file.

The seL4 Foundation licenses and accepts contributions for:

- the seL4 kernel itself and for seL4 proofs under [GPL Version 2][GPL-2.0-only],
- user code and proof libraries under the [BSD 2 Clause license][BSD-2-Clause],
- code and proofs that depend on GPL-code or GPL-proofs under GPL,
- documentation under [Creative Commons Attribution-ShareAlike][CC-BY-SA-4.0].

As in the [Linux syscall note for the GPL][GPL-note], the seL4 kernel GPL
license explicitly does *not* cover user-level code that uses kernel services by
normal system calls --- this is merely considered normal use of the kernel, and
does *not* fall under the heading of "derived work". For seL4, syscall headers
are provided under BSD. This allows you to create, distribute and commercially
develop systems on top of seL4 without fear of GPL infection from seL4.

The repositories of the seL4 GitHub organisation also contain third-party code
under additional compatible open source licenses. See the individual file
headers for details, or use one of the publicly available [SPDX] tools to
generate a software bill of materials. The directory `LICENSES/` in each
repository contains the text for all licenses that are mentioned by files in
that repository.

{% include right-up-button.html margins="mb-20" %}


[seL4-org]: https://github.com/seL4/
[GPL-2.0-only]: https://spdx.org/licenses/GPL-2.0-only.html
[BSD-2-Clause]: https://spdx.org/licenses/BSD-2-Clause.html
[CC-BY-SA-4.0]: https://spdx.org/licenses/CC-BY-SA-4.0.html
[SPDX]: https://spdx.org
[GPL-note]: https://spdx.org/licenses/Linux-syscall-note.html
[seL4 trademark]: ./index.html
