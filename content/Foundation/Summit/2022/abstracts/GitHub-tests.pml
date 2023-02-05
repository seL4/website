<!--<title>Summit abstracts</title>-->
<!--
    Copyright 2022, seL4 summit authors (see abstracts)
    SPDX-License-Identifier: CC-BY-SA-4.0
-->
<h4 class="summit-abstract-title">
    The seL4 GitHub test suite
</h4>
<p class="summit-abstract-type">
    Plenary
</p>
<p class="summit-abstract-author">
    Presented by Gerwin Klein, <span class="summit-abstract-affiliation">Proofcraft</span>
</p>
<p>
    The seL4 foundation manages a collection of over 55 repositories in the seL4 GitHub organisation.
</p>
<p>
    This talk gives an overview of the Continuous Integration (CI) setup for this collection, how the repositories are kept consistent with each other, and how we can tell after a change whether things are still working or not.
</p>
<p>
    The centre of this collection is the seL4 kernel repository itself. Its test suite includes running the formal verification of the kernel, as well as static compilation checks for all supported hardware platforms, simulation runs for all architectures, automated tests on hardware for most of the supported platforms, running benchmarks, documentation builds, etc. Both, formal verification and runtime tests are necessary – formal verification is good at showing the absence of bad behaviours, tests are good at showing the presence of good behaviours. They are also useful for validating assumptions of the formal verification. Test runs leave behind log files and build artefacts such as compiled kernel binaries or sel4tests binaries that can be simulated or run on hardware. Successful test runs automatically record the constellation of repositories that were involved in that successful run, so developers can easily trace and access known working combinations. The talk will also give an overview on how you can contribute tests, how you can help to improve the CI infrastructure, and how you can run most of these tests locally yourself.
</p>