<!-- <title>seL4 benchmarks</title> -->
<!--
Copyright 2021 seL4 Project a Series of LF Projects, LLC.
SPDX-License-Identifier: CC-BY-SA-4.0
-->

<h1>Performance</h1>
<p>This page displays the latest benchmark numbers for seL4 from the publicly
available <a href="https://github.com/seL4/sel4bench">sel4bench repository</a>.
The following times are reported as mean and standard deviation in
the format <em>mean (std dev)</em>, both rounded to the nearest integer.</p>
<ul><li><strong>IRQ invoke</strong>: Time in cycles to invoke a user-level interrupt handler running in the same
address space as the interrupted thread.</li>
<li><strong>IPC call</strong>: Time in cycles for invoking a server in a different address space on the same core.</li>
<li><strong>IPC reply</strong>: Time in cycles for a server replying to a client in a different address space on
the same core.</li>
</ul><h2>Default</h2>
<table class="data-table">
  <tr>
    <th style=" width: 8ex;" colspan="1">ISA</th>
    <th style="text-align: center; width: 4ex;" colspan="1">Mode</th>
    <th style=" width: 40%;" colspan="1">Core/SoC/Board</th>
    <th style="text-align: center; width: 8ex;" colspan="1">Clock</th>
    <th style="text-align: center;" colspan="2">IRQ Invoke</th>
    <th style="text-align: center;" colspan="2">IPC call</th>
    <th style="text-align: center;" colspan="2">IPC reply</th>
  </tr>  <tr>
    <td>Armv7a</td>
    <td class="data-table-right">32</td>
    <td>A9/i.MX6/Sabre</td>
    <td class="data-table-right">1.0 GHz</td>
    <td class="data-mean">633</td>
    <td class="data-stddev">(13)</td>
    <td class="data-mean">317</td>
    <td class="data-stddev">(3)</td>
    <td class="data-mean">335</td>
    <td class="data-stddev">(2)</td>
  </tr>  <tr>
    <td>x86_64</td>
    <td class="data-table-right">64</td>
    <td>i7-4770/Haswell</td>
    <td class="data-table-right">3.4 GHz</td>
    <td class="data-mean">1695</td>
    <td class="data-stddev">(271)</td>
    <td class="data-mean">635</td>
    <td class="data-stddev">(8)</td>
    <td class="data-mean">646</td>
    <td class="data-stddev">(9)</td>
  </tr>  <tr>
    <td>x86_64</td>
    <td class="data-table-right">64</td>
    <td>i7-6700/Skylake (without meltdown mitigation)</td>
    <td class="data-table-right">3.4 GHz</td>
    <td class="data-mean">1245</td>
    <td class="data-stddev">(196)</td>
    <td class="data-mean">376</td>
    <td class="data-stddev">(2)</td>
    <td class="data-mean">384</td>
    <td class="data-stddev">(2)</td>
  </tr>  <tr>
    <td>Armv8a</td>
    <td class="data-table-right">64</td>
    <td>A57/Tx1/Jetson</td>
    <td class="data-table-right">1.9 GHz</td>
    <td class="data-mean">866</td>
    <td class="data-stddev">(23)</td>
    <td class="data-mean">394</td>
    <td class="data-stddev">(6)</td>
    <td class="data-mean">403</td>
    <td class="data-stddev">(4)</td>
  </tr>  <tr>
    <td>RV64IMAC</td>
    <td class="data-table-right">64</td>
    <td>U54-MC/SiFive Freedom U540/Hifive</td>
    <td class="data-table-right">1.5 GHz</td>
    <td class="data-mean">1166</td>
    <td class="data-stddev">(67)</td>
    <td class="data-mean">640</td>
    <td class="data-stddev">(95)</td>
    <td class="data-mean">501</td>
    <td class="data-stddev">(9)</td>
  </tr></table>

<h2>MCS</h2>
<table class="data-table">
  <tr>
    <th style=" width: 8ex;" colspan="1">ISA</th>
    <th style="text-align: center; width: 4ex;" colspan="1">Mode</th>
    <th style=" width: 40%;" colspan="1">Core/SoC/Board</th>
    <th style="text-align: center; width: 8ex;" colspan="1">Clock</th>
    <th style="text-align: center;" colspan="2">IRQ Invoke</th>
    <th style="text-align: center;" colspan="2">IPC call</th>
    <th style="text-align: center;" colspan="2">IPC reply</th>
  </tr>  <tr>
    <td>Armv7a</td>
    <td class="data-table-right">32</td>
    <td>A9/i.MX6/Sabre</td>
    <td class="data-table-right">1.0 GHz</td>
    <td class="data-mean">854</td>
    <td class="data-stddev">(16)</td>
    <td class="data-mean">323</td>
    <td class="data-stddev">(2)</td>
    <td class="data-mean">363</td>
    <td class="data-stddev">(2)</td>
  </tr>  <tr>
    <td>x86_64</td>
    <td class="data-table-right">64</td>
    <td>i7-4770/Haswell</td>
    <td class="data-table-right">3.4 GHz</td>
    <td class="data-mean">2190</td>
    <td class="data-stddev">(460)</td>
    <td class="data-mean">630</td>
    <td class="data-stddev">(3)</td>
    <td class="data-mean">645</td>
    <td class="data-stddev">(2)</td>
  </tr>  <tr>
    <td>Armv8a</td>
    <td class="data-table-right">64</td>
    <td>A57/Tx1/Jetson</td>
    <td class="data-table-right">1.9 GHz</td>
    <td class="data-mean">1000</td>
    <td class="data-stddev">(7)</td>
    <td class="data-mean">406</td>
    <td class="data-stddev">(8)</td>
    <td class="data-mean">426</td>
    <td class="data-stddev">(3)</td>
  </tr>  <tr>
    <td>RV64IMAC</td>
    <td class="data-table-right">64</td>
    <td>U54-MC/SiFive Freedom U540/Hifive</td>
    <td class="data-table-right">1.5 GHz</td>
    <td class="data-mean">3104</td>
    <td class="data-stddev">(38)</td>
    <td class="data-mean">664</td>
    <td class="data-stddev">(102)</td>
    <td class="data-mean">589</td>
    <td class="data-stddev">(14)</td>
  </tr></table>

<h2>Compilation Details</h2>
<p>All benchmarks were built using the trustworthy-systems/sel4
docker image from the <a href="https://github.com/seL4/seL4-CAmkES-L4v-dockerfiles">seL4
docker file repository</a></p><h3>Default</h3>
<table class="data-table">
  <tr>
    <th>ISA</th>
    <th>Mode</th>
    <th>Core/SoC/Board</th>
    <th>Clock</th>
    <th>Compiler</th>
    <th>Build command</th>
  </tr>  <tr>
    <td>Armv7a</td>
    <td class="data-table-right">32</td>
    <td>A9/i.MX6/Sabre</td>
    <td class="data-table-right">1.0 GHz</td>
    <td>arm-linux-gnueabi-gcc GNU 8.3.0</td>
    <td>init-build.sh -DFASTPATH=TRUE -DHARDWARE=TRUE -DFAULT=TRUE -DAARCH32=TRUE -DPLATFORM=sabre</td>
  </tr>  <tr>
    <td>x86_64</td>
    <td class="data-table-right">64</td>
    <td>i7-4770/Haswell</td>
    <td class="data-table-right">3.4 GHz</td>
    <td>gcc GNU 8.4.0</td>
    <td>init-build.sh -DFASTPATH=TRUE -DHARDWARE=TRUE -DFAULT=TRUE -DPLATFORM=x86_64</td>
  </tr>  <tr>
    <td>x86_64</td>
    <td class="data-table-right">64</td>
    <td>i7-6700/Skylake</td>
    <td class="data-table-right">3.4 GHz</td>
    <td>gcc GNU 8.4.0</td>
    <td>init-build.sh -DKernelSkimWindow=FALSE -DFASTPATH=TRUE -DHARDWARE=TRUE -DFAULT=TRUE -DPLATFORM=x86_64</td>
  </tr>  <tr>
    <td>Armv8a</td>
    <td class="data-table-right">64</td>
    <td>A57/Tx1/Jetson</td>
    <td class="data-table-right">1.9 GHz</td>
    <td>aarch64-linux-gnu-gcc GNU 8.3.0</td>
    <td>init-build.sh -DFASTPATH=TRUE -DHARDWARE=TRUE -DFAULT=TRUE -DAARCH64=TRUE -DPLATFORM=tx1</td>
  </tr>  <tr>
    <td>RV64IMAC</td>
    <td class="data-table-right">64</td>
    <td>U54-MC/SiFive Freedom U540/Hifive</td>
    <td class="data-table-right">1.5 GHz</td>
    <td>riscv64-unknown-linux-gnu-gcc GNU 10.2.0</td>
    <td>init-build.sh -DFASTPATH=TRUE -DHARDWARE=TRUE -DFAULT=TRUE -DRISCV64=TRUE -DPLATFORM=hifive</td>
  </tr></table>

<h3>MCS</h3>
<table class="data-table">
  <tr>
    <th>ISA</th>
    <th>Mode</th>
    <th>Core/SoC/Board</th>
    <th>Clock</th>
    <th>Compiler</th>
    <th>Build command</th>
  </tr>  <tr>
    <td>Armv7a</td>
    <td class="data-table-right">32</td>
    <td>A9/i.MX6/Sabre</td>
    <td class="data-table-right">1.0 GHz</td>
    <td>arm-linux-gnueabi-gcc GNU 8.3.0</td>
    <td>init-build.sh -DFASTPATH=TRUE -DHARDWARE=TRUE -DFAULT=TRUE -DAARCH32=TRUE -DPLATFORM=sabre -DMCS=TRUE</td>
  </tr>  <tr>
    <td>x86_64</td>
    <td class="data-table-right">64</td>
    <td>i7-4770/Haswell</td>
    <td class="data-table-right">3.4 GHz</td>
    <td>gcc GNU 8.4.0</td>
    <td>init-build.sh -DFASTPATH=TRUE -DHARDWARE=TRUE -DFAULT=TRUE -DPLATFORM=x86_64 -DMCS=TRUE</td>
  </tr>  <tr>
    <td>Armv8a</td>
    <td class="data-table-right">64</td>
    <td>A57/Tx1/Jetson</td>
    <td class="data-table-right">1.9 GHz</td>
    <td>aarch64-linux-gnu-gcc GNU 8.3.0</td>
    <td>init-build.sh -DFASTPATH=TRUE -DHARDWARE=TRUE -DFAULT=TRUE -DAARCH64=TRUE -DPLATFORM=tx1 -DMCS=TRUE</td>
  </tr>  <tr>
    <td>RV64IMAC</td>
    <td class="data-table-right">64</td>
    <td>U54-MC/SiFive Freedom U540/Hifive</td>
    <td class="data-table-right">1.5 GHz</td>
    <td>riscv64-unknown-linux-gnu-gcc GNU 10.2.0</td>
    <td>init-build.sh -DFASTPATH=TRUE -DHARDWARE=TRUE -DFAULT=TRUE -DRISCV64=TRUE -DPLATFORM=hifive -DMCS=TRUE</td>
  </tr></table>

<h2>Source Code</h2>
<p>This page was generated on 2021-12-20 for sel4bench-manifest <a href="https://github.com/seL4/sel4bench-manifest/blob/254506600974131fe24e894b9c756d4828aa7d4f/default.xml">25450660</a>.</p>