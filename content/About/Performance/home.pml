<!-- <title>seL4 benchmarks</title> -->
<!--
Copyright 2020 seL4 Project a Series of LF Projects, LLC.
SPDX-License-Identifier: CC-BY-SA-4.0
-->

<h1>Performance</h1>
<p>This page displays the latest benchmark numbers for seL4 from the publicly
available <a href="https://github.com/seL4/sel4bench">sel4bench repository</a>.
The following times are measured and reported as mean with standard deviation,
both rounded to the nearest integer.</p>
<ul><li><b>IRQ invoke</b>: Time in cycles to invoke a user-level interrupt handler running in the same
address space as the interrupted thread.</li>
<li><b>IPC call</b>: Time in cycles for invoking a server in a different address space on the same core.</li>
<li><b>IPC reply</b>: Time in cycles for a server replying to a client in a different address space on
the same core.</li>
</ul><h2>Default</h2>
<table style="border-style: solid none solid none; border-color: black; border-width: 0px;; border-collapse: collapse; width: 100%; word-wrap: break-word;">
  <tr style="border-style: solid none solid none; border-color: black; border-width: 0px;">
    <th style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 1ex 2ex 1ex 2ex; border-width: 2px">ISA</th>
    <th style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 1ex 2ex 1ex 2ex; border-width: 2px">Mode</th>
    <th style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 1ex 2ex 1ex 2ex; border-width: 2px">Core/SoC/Board</th>
    <th style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 1ex 2ex 1ex 2ex; border-width: 2px">Clock</th>
    <th style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 1ex 2ex 1ex 2ex; border-width: 2px">IRQ Invoke</th>
    <th style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 1ex 2ex 1ex 2ex; border-width: 2px">IPC call</th>
    <th style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 1ex 2ex 1ex 2ex; border-width: 2px">IPC reply</th>
  </tr>  <tr style="border-style: solid none solid none; border-color: black; border-width: 0px;">
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;">Armv7a</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;; text-align: right; word-wrap: normal; white-space: nowrap;">32</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;">A9/i.MX6/Sabre</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;; text-align: right; word-wrap: normal; white-space: nowrap;">1.0 GHz</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;; text-align: right; word-wrap: normal; white-space: nowrap;">(&sigma;=18) &nbsp;&nbsp; 645</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;; text-align: right; word-wrap: normal; white-space: nowrap;">(&sigma;=2) &nbsp;&nbsp; 306</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;; text-align: right; word-wrap: normal; white-space: nowrap;">(&sigma;=2) &nbsp;&nbsp; 322</td>
  </tr>  <tr style="border-style: solid none solid none; border-color: black; border-width: 0px;">
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;">x86_64</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;; text-align: right; word-wrap: normal; white-space: nowrap;">64</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;">i7-4770/Haswell</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;; text-align: right; word-wrap: normal; white-space: nowrap;">3.4 GHz</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;; text-align: right; word-wrap: normal; white-space: nowrap;">(&sigma;=286) &nbsp;&nbsp; 1718</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;; text-align: right; word-wrap: normal; white-space: nowrap;">(&sigma;=10) &nbsp;&nbsp; 628</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;; text-align: right; word-wrap: normal; white-space: nowrap;">(&sigma;=12) &nbsp;&nbsp; 640</td>
  </tr>  <tr style="border-style: solid none solid none; border-color: black; border-width: 0px;">
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;">x86_64</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;; text-align: right; word-wrap: normal; white-space: nowrap;">64</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;">i7-4770/Skylake</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;; text-align: right; word-wrap: normal; white-space: nowrap;">3.4 GHz</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;; text-align: right; word-wrap: normal; white-space: nowrap;">(&sigma;=188) &nbsp;&nbsp; 1247</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;; text-align: right; word-wrap: normal; white-space: nowrap;">(&sigma;=3) &nbsp;&nbsp; 405</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;; text-align: right; word-wrap: normal; white-space: nowrap;">(&sigma;=3) &nbsp;&nbsp; 404</td>
  </tr>  <tr style="border-style: solid none solid none; border-color: black; border-width: 0px;">
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;">Armv8a</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;; text-align: right; word-wrap: normal; white-space: nowrap;">64</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;">A57/Tx1/Jetson</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;; text-align: right; word-wrap: normal; white-space: nowrap;">1.9 GHz</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;; text-align: right; word-wrap: normal; white-space: nowrap;">(&sigma;=22) &nbsp;&nbsp; 866</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;; text-align: right; word-wrap: normal; white-space: nowrap;">(&sigma;=12) &nbsp;&nbsp; 395</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;; text-align: right; word-wrap: normal; white-space: nowrap;">(&sigma;=3) &nbsp;&nbsp; 401</td>
  </tr>  <tr style="border-style: solid none solid none; border-color: black; border-width: 0px;">
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;">RV64IMAC</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;; text-align: right; word-wrap: normal; white-space: nowrap;">64</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;">U54-MC/SiFive Freedom U540/Hifive</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;; text-align: right; word-wrap: normal; white-space: nowrap;">1.5 GHz</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;; text-align: right; word-wrap: normal; white-space: nowrap;">(&sigma;=101) &nbsp;&nbsp; 1047</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;; text-align: right; word-wrap: normal; white-space: nowrap;">(&sigma;=4) &nbsp;&nbsp; 471</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;; text-align: right; word-wrap: normal; white-space: nowrap;">(&sigma;=55) &nbsp;&nbsp; 553</td>
  </tr></table>

<h2>MCS</h2>
<table style="border-style: solid none solid none; border-color: black; border-width: 0px;; border-collapse: collapse; width: 100%; word-wrap: break-word;">
  <tr style="border-style: solid none solid none; border-color: black; border-width: 0px;">
    <th style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 1ex 2ex 1ex 2ex; border-width: 2px">ISA</th>
    <th style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 1ex 2ex 1ex 2ex; border-width: 2px">Mode</th>
    <th style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 1ex 2ex 1ex 2ex; border-width: 2px">Core/SoC/Board</th>
    <th style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 1ex 2ex 1ex 2ex; border-width: 2px">Clock</th>
    <th style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 1ex 2ex 1ex 2ex; border-width: 2px">IRQ Invoke</th>
    <th style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 1ex 2ex 1ex 2ex; border-width: 2px">IPC call</th>
    <th style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 1ex 2ex 1ex 2ex; border-width: 2px">IPC reply</th>
  </tr>  <tr style="border-style: solid none solid none; border-color: black; border-width: 0px;">
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;">Armv7a</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;; text-align: right; word-wrap: normal; white-space: nowrap;">32</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;">A9/i.MX6/Sabre</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;; text-align: right; word-wrap: normal; white-space: nowrap;">1.0 GHz</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;; text-align: right; word-wrap: normal; white-space: nowrap;">(&sigma;=21) &nbsp;&nbsp; 835</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;; text-align: right; word-wrap: normal; white-space: nowrap;">(&sigma;=1) &nbsp;&nbsp; 315</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;; text-align: right; word-wrap: normal; white-space: nowrap;">(&sigma;=5) &nbsp;&nbsp; 341</td>
  </tr>  <tr style="border-style: solid none solid none; border-color: black; border-width: 0px;">
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;">x86_64</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;; text-align: right; word-wrap: normal; white-space: nowrap;">64</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;">i7-4770/Haswell</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;; text-align: right; word-wrap: normal; white-space: nowrap;">3.4 GHz</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;; text-align: right; word-wrap: normal; white-space: nowrap;">(&sigma;=459) &nbsp;&nbsp; 2066</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;; text-align: right; word-wrap: normal; white-space: nowrap;">(&sigma;=2) &nbsp;&nbsp; 630</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;; text-align: right; word-wrap: normal; white-space: nowrap;">(&sigma;=2) &nbsp;&nbsp; 649</td>
  </tr>  <tr style="border-style: solid none solid none; border-color: black; border-width: 0px;">
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;">Armv8a</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;; text-align: right; word-wrap: normal; white-space: nowrap;">64</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;">A57/Tx1/Jetson</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;; text-align: right; word-wrap: normal; white-space: nowrap;">1.9 GHz</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;; text-align: right; word-wrap: normal; white-space: nowrap;">(&sigma;=5) &nbsp;&nbsp; 945</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;; text-align: right; word-wrap: normal; white-space: nowrap;">(&sigma;=2) &nbsp;&nbsp; 400</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;; text-align: right; word-wrap: normal; white-space: nowrap;">(&sigma;=10) &nbsp;&nbsp; 442</td>
  </tr>  <tr style="border-style: solid none solid none; border-color: black; border-width: 0px;">
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;">RV64IMAC</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;; text-align: right; word-wrap: normal; white-space: nowrap;">64</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;">U54-MC/SiFive Freedom U540/Hifive</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;; text-align: right; word-wrap: normal; white-space: nowrap;">1.5 GHz</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;; text-align: right; word-wrap: normal; white-space: nowrap;">(&sigma;=117) &nbsp;&nbsp; 2745</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;; text-align: right; word-wrap: normal; white-space: nowrap;">(&sigma;=75) &nbsp;&nbsp; 659</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;; text-align: right; word-wrap: normal; white-space: nowrap;">(&sigma;=31) &nbsp;&nbsp; 717</td>
  </tr></table>

<h2>Compilation Details</h2>
<p>All benchmarks were built using the trustworthy-systems/sel4-riscvdocker image from the <a href="https://github.com/seL4/seL4-CAmkES-L4v-dockerfiles">seL4docker file repository</a></p><h3>Default</h3>
<table style="border-style: solid none solid none; border-color: black; border-width: 0px;; border-collapse: collapse; width: 100%; word-wrap: break-word;">
  <tr style="border-style: solid none solid none; border-color: black; border-width: 0px;">
    <th style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 1ex 2ex 1ex 2ex; border-width: 2px">ISA</th>
    <th style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 1ex 2ex 1ex 2ex; border-width: 2px">Mode</th>
    <th style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 1ex 2ex 1ex 2ex; border-width: 2px">Core/SoC/Board</th>
    <th style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 1ex 2ex 1ex 2ex; border-width: 2px">Clock</th>
    <th style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 1ex 2ex 1ex 2ex; border-width: 2px">Compiler</th>
    <th style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 1ex 2ex 1ex 2ex; border-width: 2px">Build command</th>
  </tr>  <tr style="border-style: solid none solid none; border-color: black; border-width: 0px;">
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;">Armv7a</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;; text-align: right; word-wrap: normal; white-space: nowrap;">32</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;">A9/i.MX6/Sabre</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;; text-align: right; word-wrap: normal; white-space: nowrap;">1.0 GHz</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;">arm-linux-gnueabi-gcc GNU 8.3.0</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;">init-build.sh -DFASTPATH=TRUE -DHARDWARE=TRUE -DFAULT=TRUE -DAARCH32=TRUE -DPLATFORM=sabre</td>
  </tr>  <tr style="border-style: solid none solid none; border-color: black; border-width: 0px;">
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;">x86_64</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;; text-align: right; word-wrap: normal; white-space: nowrap;">64</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;">i7-4770/Haswell</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;; text-align: right; word-wrap: normal; white-space: nowrap;">3.4 GHz</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;">gcc GNU 8.4.0</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;">init-build.sh -DFASTPATH=TRUE -DHARDWARE=TRUE -DFAULT=TRUE -DPLATFORM=x86_64</td>
  </tr>  <tr style="border-style: solid none solid none; border-color: black; border-width: 0px;">
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;">x86_64</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;; text-align: right; word-wrap: normal; white-space: nowrap;">64</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;">i7-4770/Skylake</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;; text-align: right; word-wrap: normal; white-space: nowrap;">3.4 GHz</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;">gcc GNU 8.4.0</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;">init-build.sh -DKernelSkimWindow=FALSE -DFASTPATH=TRUE -DHARDWARE=TRUE -DFAULT=TRUE -DPLATFORM=x86_64</td>
  </tr>  <tr style="border-style: solid none solid none; border-color: black; border-width: 0px;">
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;">Armv8a</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;; text-align: right; word-wrap: normal; white-space: nowrap;">64</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;">A57/Tx1/Jetson</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;; text-align: right; word-wrap: normal; white-space: nowrap;">1.9 GHz</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;">aarch64-linux-gnu-gcc GNU 8.3.0</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;">init-build.sh -DFASTPATH=TRUE -DHARDWARE=TRUE -DFAULT=TRUE -DAARCH64=TRUE -DPLATFORM=tx1</td>
  </tr>  <tr style="border-style: solid none solid none; border-color: black; border-width: 0px;">
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;">RV64IMAC</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;; text-align: right; word-wrap: normal; white-space: nowrap;">64</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;">U54-MC/SiFive Freedom U540/Hifive</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;; text-align: right; word-wrap: normal; white-space: nowrap;">1.5 GHz</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;">riscv64-unknown-linux-gnu-gcc GNU 10.2.0</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;">init-build.sh -DFASTPATH=TRUE -DHARDWARE=TRUE -DFAULT=TRUE -DRISCV64=TRUE -DPLATFORM=hifive</td>
  </tr></table>

<h3>MCS</h3>
<table style="border-style: solid none solid none; border-color: black; border-width: 0px;; border-collapse: collapse; width: 100%; word-wrap: break-word;">
  <tr style="border-style: solid none solid none; border-color: black; border-width: 0px;">
    <th style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 1ex 2ex 1ex 2ex; border-width: 2px">ISA</th>
    <th style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 1ex 2ex 1ex 2ex; border-width: 2px">Mode</th>
    <th style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 1ex 2ex 1ex 2ex; border-width: 2px">Core/SoC/Board</th>
    <th style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 1ex 2ex 1ex 2ex; border-width: 2px">Clock</th>
    <th style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 1ex 2ex 1ex 2ex; border-width: 2px">Compiler</th>
    <th style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 1ex 2ex 1ex 2ex; border-width: 2px">Build command</th>
  </tr>  <tr style="border-style: solid none solid none; border-color: black; border-width: 0px;">
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;">Armv7a</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;; text-align: right; word-wrap: normal; white-space: nowrap;">32</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;">A9/i.MX6/Sabre</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;; text-align: right; word-wrap: normal; white-space: nowrap;">1.0 GHz</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;">arm-linux-gnueabi-gcc GNU 8.3.0</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;">init-build.sh -DFASTPATH=TRUE -DHARDWARE=TRUE -DFAULT=TRUE -DAARCH32=TRUE -DPLATFORM=sabre -DMCS=TRUE</td>
  </tr>  <tr style="border-style: solid none solid none; border-color: black; border-width: 0px;">
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;">x86_64</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;; text-align: right; word-wrap: normal; white-space: nowrap;">64</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;">i7-4770/Haswell</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;; text-align: right; word-wrap: normal; white-space: nowrap;">3.4 GHz</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;">gcc GNU 8.4.0</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;">init-build.sh -DFASTPATH=TRUE -DHARDWARE=TRUE -DFAULT=TRUE -DPLATFORM=x86_64 -DMCS=TRUE</td>
  </tr>  <tr style="border-style: solid none solid none; border-color: black; border-width: 0px;">
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;">Armv8a</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;; text-align: right; word-wrap: normal; white-space: nowrap;">64</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;">A57/Tx1/Jetson</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;; text-align: right; word-wrap: normal; white-space: nowrap;">1.9 GHz</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;">aarch64-linux-gnu-gcc GNU 8.3.0</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;">init-build.sh -DFASTPATH=TRUE -DHARDWARE=TRUE -DFAULT=TRUE -DAARCH64=TRUE -DPLATFORM=tx1 -DMCS=TRUE</td>
  </tr>  <tr style="border-style: solid none solid none; border-color: black; border-width: 0px;">
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;">RV64IMAC</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;; text-align: right; word-wrap: normal; white-space: nowrap;">64</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;">U54-MC/SiFive Freedom U540/Hifive</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;; text-align: right; word-wrap: normal; white-space: nowrap;">1.5 GHz</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;">riscv64-unknown-linux-gnu-gcc GNU 10.2.0</td>
    <td style="border-style: solid none solid none; border-color: black; border-width: 0px;; padding: 0.8ex 2ex 0.8ex 2ex;">init-build.sh -DFASTPATH=TRUE -DHARDWARE=TRUE -DFAULT=TRUE -DRISCV64=TRUE -DPLATFORM=hifive -DMCS=TRUE</td>
  </tr></table>

<h2>Source Code</h2>
<p>This page was generated on 2021-11-09 for sel4bench-manifest <a href="https://github.com/seL4/sel4bench-manifest/blob/a4b30cc533097e03fda28c46d1fefc1130d715b1/default.xml">a4b30cc5</a>.</p>