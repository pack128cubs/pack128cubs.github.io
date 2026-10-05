---
layout: default
title: Parents
hideTitle: true
permalink: /parents/
---

<section class="px-4 mt-6 sm:px-6 lg:px-8">
  <div class="max-w-6xl mx-auto">
    <div class="mb-10 text-center">
      <h1 class="mt-0 mb-3 text-4xl font-extrabold tracking-tight text-cub-blue sm:text-5xl">
        For Pack {{ site.pack.number }} families
      </h1>
      <p class="mt-4 text-base text-slate-600 max-w-xl mx-auto">
        The links we get asked for most, in one place.
      </p>
    </div>

    <div class="grid gap-6 md:grid-cols-2">

      <article class="flex flex-col p-8 bg-white rounded-2xl ring-1 ring-slate-200">
        <h3 class="mt-0 mb-0 text-xl font-bold tracking-[0.1em] uppercase text-cub-blue">Scoutbook</h3>
        <p class="mt-3 text-slate-600">
          Your scout's advancement, pack emails, and event reminders all run through Scoutbook. Sign in with your
          my.scouting.org account.
        </p>
        <a href="{{ site.links.scoutbook }}" target="_blank" rel="noopener"
           class="flex items-baseline justify-between gap-4 px-5 py-4 mt-auto transition rounded-xl bg-cub-blue ring-1 ring-cub-blue hover:bg-blue-900">
          <span class="text-xs font-semibold tracking-[0.2em] uppercase text-cub-gold/90">Open Scoutbook</span>
          <span class="text-cub-gold" aria-hidden="true">→</span>
        </a>
      </article>

      <article class="flex flex-col p-8 bg-white rounded-2xl ring-1 ring-slate-200">
        <h3 class="mt-0 mb-0 text-xl font-bold tracking-[0.1em] uppercase text-cub-blue">Volunteer</h3>
        <p class="mt-3 text-slate-600">
          The pack runs on parents. Pick a job that fits your schedule — bringing snacks, running a game, helping
          at the campout — and you'll get a reminder before the date.
        </p>
        <a href="{{ site.links.volunteer_signup }}" target="_blank" rel="noopener"
           class="flex items-baseline justify-between gap-4 px-5 py-4 mt-6 transition rounded-xl bg-cub-gold ring-1 ring-cub-gold hover:bg-yellow-300">
          <span class="text-xs font-semibold tracking-[0.2em] uppercase text-cub-blue">See open volunteer slots</span>
          <span class="text-cub-blue" aria-hidden="true">→</span>
        </a>
      </article>

      <article class="flex flex-col p-8 bg-white rounded-2xl ring-1 ring-slate-200">
        <h3 class="mt-0 mb-0 text-xl font-bold tracking-[0.1em] uppercase text-cub-blue">Before a campout</h3>
        <p class="mt-3 text-slate-600">
          Every camper needs a current Annual Health and Medical Record, parts A and B. Bring a printed copy and a
          copy of your insurance card. Adults also complete the free Safeguarding Youth training online.
        </p>
        <div class="flex flex-col gap-3 mt-6">
          <a href="{{ site.links.medical_form }}" target="_blank" rel="noopener"
             class="flex items-baseline justify-between gap-4 px-5 py-4 transition rounded-xl bg-cub-blue ring-1 ring-cub-blue hover:bg-blue-900">
            <span class="text-xs font-semibold tracking-[0.2em] uppercase text-cub-gold/90">Medical form A &amp; B (PDF)</span>
            <span class="text-cub-gold" aria-hidden="true">→</span>
          </a>
          <a href="{{ site.links.my_scouting }}" target="_blank" rel="noopener"
             class="flex items-baseline justify-between gap-4 px-5 py-4 transition bg-white rounded-xl ring-1 ring-cub-blue/30 hover:ring-cub-blue">
            <span class="text-xs font-semibold tracking-[0.2em] uppercase text-cub-blue">Safeguarding Youth training</span>
            <span class="text-cub-blue" aria-hidden="true">→</span>
          </a>
        </div>
      </article>

      <article class="flex flex-col p-8 bg-white rounded-2xl ring-1 ring-slate-200">
        <h3 class="mt-0 mb-0 text-xl font-bold tracking-[0.1em] uppercase text-cub-blue">Committee meetings</h3>
        <p class="mt-3 text-slate-600">
          The pack committee meets on the first Sunday of the month, 5–7 pm, at St. Mary's to plan meetings,
          outings, and the budget. All parents are welcome, and minutes go out by email afterward.
        </p>
        <a href="{{ '/calendar/' | relative_url }}"
           class="flex items-baseline justify-between gap-4 px-5 py-4 mt-auto transition bg-white rounded-xl ring-1 ring-cub-blue/30 hover:ring-cub-blue">
          <span class="text-xs font-semibold tracking-[0.2em] uppercase text-cub-blue">Next meeting on the calendar</span>
          <span class="text-cub-blue" aria-hidden="true">→</span>
        </a>
      </article>

      <article class="flex flex-col p-8 bg-white rounded-2xl ring-1 ring-slate-200 md:col-span-2">
        <h3 class="mt-0 mb-0 text-xl font-bold tracking-[0.1em] uppercase text-cub-blue">Council and district events</h3>
        <p class="mt-3 text-slate-600">
          Day camps, Camp Winton, district campouts, and leader training are run by the {{ site.pack.council }} and
          the {{ site.pack.district }}. Registration for those happens on the council website.
        </p>
        <div class="mt-6">
          <a href="{{ site.links.council }}" target="_blank" rel="noopener"
             class="inline-flex items-center gap-2 font-bold text-cub-blue hover:underline">
            {{ site.pack.council }} website <span aria-hidden="true">→</span>
          </a>
        </div>
      </article>

    </div>
  </div>
</section>
