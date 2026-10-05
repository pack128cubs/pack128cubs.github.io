---
layout: default
title: Register
hideTitle: true
permalink: /register/
---

<!-- FOUR STEPS -->
<section class="px-4 mt-6 sm:px-6 lg:px-8">
  <div class="max-w-6xl mx-auto">
    <div class="mb-10 text-center">
      <h1 class="mt-0 mb-3 text-4xl font-extrabold tracking-tight text-cub-blue sm:text-5xl">
        You're in.
      </h1>
      <p class="text-xs font-semibold tracking-[0.3em] uppercase text-cub-blue/60">Pack {{ site.pack.number }} · {{ site.pack.program_year }}</p>
      <p class="mt-10 text-base text-slate-600 max-w-xl mx-auto">
        Four short steps to make it official.
      </p>
    </div>

    <div class="grid gap-6 md:grid-cols-2">

      <!-- STEP 1 · Say hello -->
      <article class="flex flex-col p-8 bg-white rounded-2xl ring-1 ring-slate-200">
        <div class="flex items-center justify-between">
          <span class="inline-flex items-center justify-center w-12 h-12 text-xl font-extrabold rounded-full bg-cub-blue text-cub-gold">1</span>
          <span class="text-xs font-semibold tracking-[0.2em] uppercase text-cub-blue/60">~5 minutes</span>
        </div>
        <h3 class="mt-5 mb-0 text-xl font-bold tracking-[0.1em] uppercase text-cub-blue">
          Tell us about your scout
        </h3>
        <p class="mt-3 text-slate-600">
          Let us know your child's name and grade so we can introduce you to the right den leader and add you
          to pack emails.
        </p>
        <dl class="mt-5 text-sm text-slate-500 space-y-1">
          <div class="flex gap-2"><dt class="font-semibold text-cub-blue/80 min-w-24">Where:</dt><dd>Pack {{ site.pack.number }} interest form <span class="tbd">form link to add</span></dd></div>
          <div class="flex gap-2"><dt class="font-semibold text-cub-blue/80 min-w-24">Done when:</dt><dd>A leader replies to welcome you</dd></div>
        </dl>
        {% include contact-button.html label="Open the interest form →" class="flex items-baseline justify-between gap-4 px-5 py-4 mt-6 text-xs font-semibold tracking-[0.2em] uppercase transition rounded-xl bg-cub-blue text-cub-gold ring-1 ring-cub-blue hover:bg-blue-900" %}
      </article>

      <!-- STEP 2 · Scouting America registration -->
      <article class="flex flex-col p-8 bg-white rounded-2xl ring-1 ring-slate-200">
        <div class="flex items-center justify-between">
          <span class="inline-flex items-center justify-center w-12 h-12 text-xl font-extrabold rounded-full bg-cub-blue text-cub-gold">2</span>
          <span class="text-xs font-semibold tracking-[0.2em] uppercase text-cub-blue/60">~10 minutes</span>
        </div>
        <h3 class="mt-5 mb-0 text-xl font-bold tracking-[0.1em] uppercase text-cub-blue">
          Register with Scouting America
        </h3>
        <p class="mt-3 text-slate-600">
          Create an account and apply online. When prompted for a unit, choose
          <strong class="text-cub-blue">Pack 0128 — {{ site.pack.chartered_org }}, Sacramento</strong> so your scout lands in the right pack.
          The fee covers national and {{ site.pack.council }} registration. <span class="tbd">current fee to add</span>
        </p>
        <p class="mt-3 text-sm text-slate-500">
          <strong class="text-cub-blue">Returning scouts:</strong> Scouting America bills 12 months from your last registration,
          so you will get a renewal email when it comes due.
        </p>
        <dl class="mt-5 text-sm text-slate-500 space-y-1">
          <div class="flex gap-2"><dt class="font-semibold text-cub-blue/80 min-w-24">Where:</dt><dd>my.scouting.org</dd></div>
          <div class="flex gap-2"><dt class="font-semibold text-cub-blue/80 min-w-24">Done when:</dt><dd>You receive a registration confirmation email</dd></div>
        </dl>
        <a href="{{ site.links.my_scouting }}"
           target="_blank" rel="noopener"
           class="flex items-baseline justify-between gap-4 px-5 py-4 mt-6 transition rounded-xl bg-cub-blue ring-1 ring-cub-blue hover:bg-blue-900">
          <span class="text-xs font-semibold tracking-[0.2em] uppercase text-cub-gold/90">Go to my.scouting.org</span>
          <span class="text-cub-gold" aria-hidden="true">→</span>
        </a>
        <p class="mt-3 text-xs text-slate-500 italic">
          Trouble registering online? Tell your den leader and our New Member Coordinator will help.
        </p>
      </article>

      <!-- STEP 3 · Pack dues -->
      <article class="flex flex-col p-8 bg-white rounded-2xl ring-1 ring-slate-200">
        <div class="flex items-center justify-between">
          <span class="inline-flex items-center justify-center w-12 h-12 text-xl font-extrabold rounded-full bg-cub-blue text-cub-gold">3</span>
          <span class="text-xs font-semibold tracking-[0.2em] uppercase text-cub-blue/60">~5 minutes</span>
        </div>
        <h3 class="mt-5 mb-0 text-xl font-bold tracking-[0.1em] uppercase text-cub-blue">
          Pay Pack {{ site.pack.number }} dues
        </h3>
        <p class="mt-3 text-slate-600">
          Pack dues pay for awards, meeting space, supplies, and pack events through the year.
          <span class="tbd">amount and what it covers to add</span>
        </p>
        <dl class="mt-5 text-sm text-slate-500 space-y-1">
          <div class="flex gap-2"><dt class="font-semibold text-cub-blue/80 min-w-24">Where:</dt><dd><span class="tbd">how to pay to add</span></dd></div>
          <div class="flex gap-2"><dt class="font-semibold text-cub-blue/80 min-w-24">Done when:</dt><dd>The treasurer confirms your payment</dd></div>
        </dl>
        <p class="mt-6 text-sm text-slate-600">
          <strong class="text-cub-blue">Financial assistance is available</strong> for dues, uniforms, and activities.
          Ask any leader — requests are kept private.
        </p>
      </article>

      <!-- STEP 4 · Uniform -->
      <article class="flex flex-col p-8 bg-white rounded-2xl ring-1 ring-slate-200">
        <div class="flex items-center justify-between">
          <span class="inline-flex items-center justify-center w-12 h-12 text-xl font-extrabold rounded-full bg-cub-blue text-cub-gold">4</span>
          <span class="text-xs font-semibold tracking-[0.2em] uppercase text-cub-blue/60">~45 minutes</span>
        </div>
        <h3 class="mt-5 mb-0 text-xl font-bold tracking-[0.1em] uppercase text-cub-blue">
          Get a uniform
        </h3>
        <p class="mt-3 text-slate-600">
          Class A uniforms (button down, belts, and scarves) can be purchased <a href="https://www.scoutshop.org/" rel="noopener" class="text-cub-blue underline decoration-cub-blue/30 underline-offset-2 hover:decoration-cub-blue">online</a> or at the Scout Shop in North Sac.
          Each rank is a little different, so wait until you know your scout's den. <a href="https://www.scouting.org/programs/cub-scouts/cub-scout-uniform/" rel="noopener" class="text-cub-blue underline decoration-cub-blue/30 underline-offset-2 hover:decoration-cub-blue">See the uniform by rank</a>.
        </p>
        <p class="mt-3 text-slate-600">
          For active days we wear our &ldquo;Class B&rdquo; uniforms. The Pack {{ site.pack.number }} t-shirt can be purchased from the quartermaster at any pack meeting for $10.
        </p>
        <div class="flex items-center justify-center gap-8 p-5 mt-4 rounded-xl bg-slate-50 ring-1 ring-slate-200">
          <img src="{{ '/assets/images/brand/' | append: site.brand.chest_mark | append: '.png' | relative_url }}" alt="Pack {{ site.pack.number }} chest mark: Scouting the Sierras"
               class="w-auto h-24" loading="lazy" decoding="async" />
          <img src="{{ '/assets/images/brand/shield.png' | relative_url }}" alt="Pack {{ site.pack.number }} shield"
               class="w-auto h-36" loading="lazy" decoding="async" />
        </div>
        <dl class="mt-5 text-sm text-slate-500 space-y-1">
          <div class="flex gap-2"><dt class="font-semibold text-cub-blue/80 min-w-24">Where:</dt><dd>Scout Shop in North Sac or online (Class A); the quartermaster (Class B)</dd></div>
          <div class="flex gap-2"><dt class="font-semibold text-cub-blue/80 min-w-24">Done when:</dt><dd>Your scout has a Class A shirt and scarf that fit, and a Pack {{ site.pack.number }} t-shirt</dd></div>
        </dl>
      </article>

    </div>
  </div>
</section>

<!-- STUCK FOOTER -->
<section class="px-4 mt-12 mb-12 sm:px-6 lg:px-8 sm:mt-16">
  <div class="max-w-6xl mx-auto overflow-hidden text-center rounded-3xl bg-cub-blue">
    <div class="px-6 py-12 sm:px-10">
      <h2 class="mt-0 text-3xl font-extrabold tracking-[0.1em] uppercase text-cub-gold sm:text-4xl">
        Stuck on a step?
      </h2>
      <p class="mt-3 text-blue-50 max-w-xl mx-auto">
        Registration paperwork is the least fun part of scouting. We've all done it. Send us a note and a parent leader will help you sort it out.
      </p>
      <div class="mt-8">
        <a href="mailto:{{ site.email }}?subject=Registration%20help"
           class="inline-flex items-center justify-center px-7 py-3.5 font-bold transition bg-cub-gold rounded-xl text-cub-blue hover:bg-yellow-300">
          Email {{ site.email }}
        </a>
      </div>
    </div>
  </div>
</section>
