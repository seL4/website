<!--<title>Retrofit</title>
Copyright 2020 seL4 Project a Series of LF Projects, LLC.
     SPDX-License-Identifier: CC-BY-SA-4.0
-->
<h1>
  Retrofitting and transitioning to seL4
</h1> <br>
  <p>
    This page discusses the issues a business will need to consider for a <b>“transition to seL4”</b>, whether creating a
    new product or upgrading an existing product.</p>
   <p>Ultimately,
    the best approach is to <a href="/contact/">contact us</a>
    to discuss your needs and aims, but
    brainstorming through the considerations described below is a good
    first step in any case. This will also give you an idea of the
    role that seL4 can play in securing software systems across a range of
    industry verticals.
  </p>
  <p>
    More information about this process is available in
      <a href="https://trustworthy.systems/publications/abstracts/Klein_AKMHF_18.abstract">this article</a> or in
      <a href="https://trustworthy.systems/publications/papers/Kuz_19.abstract">these slides</a>.
  </p>
  <p>
    You might also have questions on the <b> licence </b> and its implications.
    For this, read <a href="https://microkerneldude.wordpress.com/2019/12/09/what-does-sel4s-license-imply/">Gernot’s licensing blog</a> and
    <a href="/contact/">contact us</a> if you have
    any questions!
  </p>
  <p>Now to the considerations.</p>
  <ol>
    <li> <b>The aim: Security through isolation</b>.
      <img src="/images/trusted.svg" style="width:300px; float:right;" alt="seL4 system"/>
      <p>The first step is to identify the security and
      safety requirements of your system (what are the assets that need protecting), and the threat
      model (what are the attacks or failures that threaten those assets).</p>
      <p>seL4’s power and added value lie in the proved <em>isolation</em> that
      it provides. Being an OS kernel, its duty is to control
      access to resources and communication between entities.
      By using seL4, you
      get the highest assurance that components can be properly
      isolated from each other, with communication only possible
      through explicitly provided channels.</p>
      <p>This first step, therefore, helps to identify what it is that
      you would like to isolate in your system. Typically this comes down to protecting some small
      but critical component(s) that perform sensitive operations from a large and untrustworthy, but still useful, code base.</p>
      <p>An example is a critical control loop which takes inputs from a number of sensors, including cameras with complex drivers and image processing software.<p>
    </li>
    <li> <b> seL4-ready?</b>
      <p>
      The next step is to check which hardware platform (and exact
      configuration) your product is or will be running on and whether
      this platform is already <a href="https://docs.sel4.systems/Hardware/">supported by seL4</a>. You will also need
      to check whether seL4 is <a href="https://docs.sel4.systems/projects/sel4/verified-configurations.html#available-verified-configurations">verified on this configuration</a> and
      need to know what your assurance and certification requirements
      are and whether the proofs can support these.</p>
      <p>If the answer to some of these questions is &ldquo;no&rdquo;, you can
      check whether it’s on the <a href="https://docs.sel4.systems/projects/roadmap.html">roadmap</a>
      of seL4, and
      <a href="/contact/">contact us</a> to
      discuss extending seL4’s support.</p>
      <p>Keep in mind that even if a particular configuration is not (yet) verified, it will still be highly robust, owing to sharing the design and much of its code with verified configurations.</p>

      <p>
      Beside the kernel, your system is likely to require a number of other OS components:
      remember that seL4 is just a microkernel, and will require a number of
      OS services to run. You can check the list of <a href="https://docs.sel4.systems/projects/available-user-components.html">available components</a>
      and if the ones you need are missing,
      <a href="/contact/">contact us</a>, or better yet
      <a href="/Contribute">contribute</a>.</p>
    </li>
    <li> <b>Gradually getting there: Incremental cyber retrofit</b>

      <p>
      Systems are rarely built from scratch, even a new product typically incorporates significant amounts of legacy software. And frequently the aim is to increase an existing product's resilience to cyber attacks.</p>
      <p>The usual approach here is what we call an <em>incremental cyber retrofit</em>, which we describe in detail in
      <a href="https://trustworthy.systems/publications/abstracts/Klein_AKMHF_18.abstract">this article</a>.  In a nutshell, the idea is to gradually adapt the
      existing architecture.</p>
      <p>The first step is to put the complete legacy system into a virtual machine (VM) running
      on seL4. This in itself adds no security (only a little bit of overhead), but it serves as a starting point for incremental modularisation.</p>
      <p>The next step is to extract and isolate coarse-grain subsystems, moving from a system with a single VM to one with multiple communicating VMs.</p>
      <p>In subsequent steps this is repeated and refined until individual trusted components are placed into their own, isolated, sandboxes running
      natively on seL4.</p>

      <img src="/images/retrofit.png" style="width:700px;" alt="seL4 system"
	   />
    </li>
  </ol>
<p>
After this you should have a much more robust system that can take advantage of seL4's proved properties to provide significantly better resilience to cyber attack.</p>
