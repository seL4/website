<!--<title>Summit abstracts</title>-->
<!--
    Copyright 2022, seL4 summit authors (see abstracts)
    SPDX-License-Identifier: CC-BY-SA-4.0
-->
<h4 class="summit-abstract-title">
    Porting U-Boot drivers to seL4
</h4>
<p class="summit-abstract-type">
    Talk
</p>
<p class="summit-abstract-author">
    Presented by Mark Jenkinson, in collaboration with Stephen Williams, <span class="summit-abstract-affiliation">Capgemini</span>
</p>
<p>
    Our work has been aimed towards easing the overheads for new users to adopt seL4. To support this, we have developed a relatively quick and easy method for providing a high level of driver coverage for an i.MX8MQ-based board (Avnet MaaXBoard). The approach implements a framework to support the U-Boot Driver Model, a standard model employed by U-Boot for defining and interfacing to device drivers. With that framework implemented, the drivers already available in U-Boot (which comprise a very large set) can be made available within seL4 with either limited or zero code changes to the driver itself.
</p>
<p>
    Our approach has so far been used to port several drivers from U-Boot including USB3.0, Ethernet, MMC, GPIO, I2C, SPI.
</p>
<p>
    This approach is not optimised for performance or verifiability and is unlikely to be used for drivers where this is paramount. However, our approach is intended to be complementary to such use cases, with significantly less handcrafting of bespoke drivers, helping to lower the bar for entry into seL4 development.
</p>