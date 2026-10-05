---
layout: default
title: Join Pack 128
hideTitle: true
permalink: /join/
---

<!-- HERO -->
<section class="px-4 mt-6 sm:px-6 lg:px-8">
  <div class="max-w-6xl mx-auto overflow-hidden rounded-3xl bg-cub-blue">
    <div class="px-6 py-12 text-center sm:px-10 sm:py-16">
      <h1 class="mt-0 mb-0 text-4xl font-extrabold tracking-[0.08em] uppercase text-cub-gold sm:text-5xl">
        Come see what we do.
      </h1>
      <p class="max-w-2xl mx-auto mt-5 text-lg text-blue-50">
        The easiest way to decide is to visit. Bring your child to a pack meeting, meet the den leader for
        their grade, and see if it fits — no commitment and no uniform needed.
      </p>
      <div class="mt-8">
        <a href="{{ '/calendar/' | relative_url }}"
           class="inline-flex items-center justify-center px-7 py-4 font-bold transition bg-cub-gold rounded-xl text-cub-blue hover:bg-yellow-300">
          Find the next pack meeting
        </a>
      </div>
    </div>
  </div>
</section>

<!-- TWO CTAs -->
<section class="px-4 mt-12 mb-12 sm:px-6 lg:px-8 sm:mt-16">
  <div class="grid max-w-6xl gap-6 mx-auto md:grid-cols-2">

    <a href="{{ '/register/' | relative_url }}"
       class="group block p-8 transition rounded-2xl bg-cub-gold ring-1 ring-cub-gold hover:bg-yellow-300">
      <h2 class="mt-0 mb-0 text-2xl font-extrabold tracking-tight text-cub-blue sm:text-3xl">
        Sign up for Pack {{ site.pack.number }}
      </h2>
      <p class="mt-3 text-cub-blue/90">
        Four short steps to register your scout for the year. We'll walk you through each one.
      </p>
      <span class="inline-flex items-center gap-1 mt-6 font-bold text-cub-blue">
        See the steps
        <span aria-hidden="true" class="transition-transform group-hover:translate-x-0.5">→</span>
      </span>
    </a>

    <div class="block p-8 bg-white rounded-2xl ring-1 ring-cub-blue/20">
      <h2 class="mt-0 mb-0 text-2xl font-extrabold tracking-tight text-cub-blue sm:text-3xl">
        Contact us to learn more
      </h2>
      <p class="mt-3 text-slate-600">
        Talk to a parent leader, ask anything, or arrange to visit a meeting first.
      </p>
      {% include contact-button.html label="Get in touch →" class="inline-flex items-center gap-1 mt-6 font-bold text-cub-blue hover:underline" %}
    </div>

  </div>
</section>
