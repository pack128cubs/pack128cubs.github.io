---
layout: default
navbarText: Sacramento, CA
---

<!-- HERO -->
<section class="relative">
  <div class="absolute inset-0">
    <!-- Replace with your hero image -->
    <img src="{{ '/assets/images/placeholders/hero.svg' | relative_url }}" alt="" class="object-cover w-full h-full" fetchpriority="high" decoding="async" />
    <div class="absolute inset-0 bg-black/45"></div>
  </div>
  <div class="relative max-w-6xl px-4 py-16 mx-auto text-center text-white sm:py-24">
    <img src="{{ '/assets/images/brand/shield-white.png' | relative_url }}" alt="" class="w-auto h-40 mx-auto mb-8 sm:h-56 drop-shadow-lg" decoding="async" />
    <h1 class="text-4xl font-extrabold tracking-wide uppercase sm:text-5xl md:text-6xl text-cub-gold">
      Adventure Begins Here
    </h1>
    <p class="max-w-2xl mx-auto mt-4 text-lg sm:text-xl">
      Join <span class="font-semibold">Pack {{ site.pack.number }}</span> in {{ site.pack.neighborhood }} — where every child explores, belongs, and leads.
    </p>
    <div class="flex flex-wrap justify-center gap-4 mt-8">
      <a href="{{ '/join/' | relative_url }}" class="inline-flex items-center px-6 py-3 font-bold transition bg-yellow-400 rounded-xl text-slate-900 hover:bg-yellow-300">
        Join Now
      </a>
      <a href="{{ '/calendar/' | relative_url }}" class="inline-flex items-center px-6 py-3 font-semibold text-black transition rounded-xl bg-white/90 ring-1 ring-white/40 hover:bg-white/100">
        Upcoming Events
      </a>
    </div>
  </div>
</section>

<!-- EVENTS / CALENDAR PREVIEW -->
{%- assign now_epoch = site.time | date: "%s" | plus: 0 -%}
{%- assign shown = 0 -%}
{%- assign remaining_events = 0 -%}
{%- assign additional_events = '' -%}

<!-- Collect and sort events -->
{%- assign upcoming = '' | split: '' -%}
{%- for p in site.pages -%}
  {%- if p.url and p.url contains '/events/' and p.event -%}
    {%- assign ev_end_iso = p.event.end.dateTime | default: p.event.end.date | default: p.event.start.dateTime | default: p.event.start.date -%}
    {%- if ev_end_iso -%}
      {%- assign ev_epoch = ev_end_iso | date: "%s" | plus: 0 -%}
      {%- if ev_epoch >= now_epoch -%}
        {%- assign upcoming = upcoming | push: p -%}
      {%- endif -%}
    {%- endif -%}
  {%- endif -%}
{%- endfor -%}
{%- assign upcoming = upcoming | sort: 'event.sort_key' -%}

<section class="pt-12 pb-8 bg-slate-50">
  <div class="max-w-6xl px-4 mx-auto">
    <h2 class="text-2xl font-extrabold tracking-wide text-center uppercase sm:text-4xl text-cub-blue leading-1">Coming Up</h2>
    <div class="grid items-stretch gap-6 mt-10 md:grid-cols-3">
      {%- for p in upcoming -%}
        {%- if shown < 2 -%}
          {%- assign ev_iso = p.event.start.dateTime | default: p.event.start.date -%}
          {%- assign end_iso = p.event.end.dateTime | default: p.event.end.date -%}
          {%- comment -%} All-day events end on the day after their last day. {%- endcomment -%}
          {%- if p.event.start.date and p.event.start.dateTime == nil and end_iso -%}
            {%- assign end_iso = end_iso | date: "%s" | minus: 43200 | date: "%Y-%m-%d" -%}
          {%- endif -%}
          {%- assign ev_day  = ev_iso  | date: "%Y-%m-%d" -%}
          {%- assign end_day = end_iso | date: "%Y-%m-%d" -%}
          <article class="flex flex-col justify-between h-full p-5 bg-white shadow-sm rounded-2xl ring-1 ring-slate-200">
            <!-- Date pinned top -->
            <p class="text-sm text-slate-500">
              {{ ev_iso | date: "%a • %b %-d" }}
              {%- if end_iso and end_day != ev_day -%}
                &nbsp;– {{ end_iso | date: "%a • %b %-d" }}
              {%- endif -%}
            </p>

            <!-- Middle content centered -->
            <div class="flex flex-col items-center justify-center text-center">
              <h3 class="mt-1 font-semibold">
                <a href="{{ p.url | relative_url }}" class="hover:underline">
                  {{ p.title | default: "Pack Event" }}
                </a>
              </h3>

              <!-- Location -> city only (public events only) -->
              {%- assign loc = p.event.location | default: p.location | default: p.venue -%}
              {%- if loc and p.layout contains "public" -%}
                {%- assign parts = loc | split: ',' -%}
                {%- comment -%} "Venue, Street, City, ST" or "City, ST": the city is second from the end. {%- endcomment -%}
                {%- if parts.size >= 2 -%}
                  {%- assign city_index = parts.size | minus: 2 -%}
                  {%- assign city = parts[city_index] | strip -%}
                {%- else -%}
                  {%- assign city = loc -%}
                {%- endif -%}
                <p class="mt-2 text-sm text-slate-600">{{ city }}</p>
              {%- endif -%}

              <!-- Times only for same-day timed events -->
              {%- if p.event.start.dateTime and end_iso and end_day == ev_day -%}
                <p class="mt-1 text-xs text-slate-500">
                  {{ p.event.start.dateTime | date: "%-I:%M %p" }}
                  {%- if p.event.end and p.event.end.dateTime -%}
                    &nbsp;– {{ p.event.end.dateTime | date: "%-I:%M %p" }}
                  {%- endif -%}
                </p>
              {%- endif -%}
            </div>

            <a href="{{ p.url | relative_url }}" class="inline-flex mt-3 font-semibold text-slate-900 hover:underline">Details</a>
          </article>
          {%- assign shown = shown | plus: 1 -%}
        {%- else -%}
          {%- if remaining_events < 3 -%}
            {%- assign remaining_events = remaining_events | plus: 1 -%}
            {%- assign current_ev_iso = p.event.start.dateTime | default: p.event.start.date -%}
            {%- capture event_item -%}
              <li class="pb-3 mb-3 border-b border-slate-100 last:border-0 last:mb-0 last:pb-0">
                <p class="text-sm text-slate-500">{{ current_ev_iso | date: "%b %-d" }}</p>
                <a href="{{ p.url | relative_url }}" class="font-medium hover:underline">{{ p.title | default: "Pack Event" }}</a>
              </li>
            {%- endcapture -%}
            {%- assign additional_events = additional_events | append: event_item -%}
          {%- endif -%}
        {%- endif -%}
      {%- endfor -%}

      <!-- Third card with list of more events -->
      {%- if remaining_events > 0 -%}
        <article class="flex flex-col justify-between h-full p-5 bg-white shadow-sm rounded-2xl ring-1 ring-slate-200">
          <h3 class="py-0 mt-0 mb-3 font-semibold">More Upcoming Events</h3>
          <div class="flex items-center flex-1">
            <ul class="w-full text-sm">
              {{ additional_events }}
            </ul>
          </div>
          <a href="{{ '/calendar/' | relative_url }}" class="inline-flex mt-3 font-semibold text-slate-900 hover:underline">See All Events</a>
        </article>
      {%- endif -%}
    </div>

    {%- if upcoming.size == 0 -%}
      <p class="mt-6 text-center text-slate-600">No upcoming events found.</p>
    {%- endif -%}

    <div class="mt-8 text-center">
      <a href="{{ '/calendar/' | relative_url }}" class="inline-flex items-center px-5 py-3 font-semibold text-white transition rounded-lg bg-slate-900 hover:bg-slate-800">
        Full Calendar
      </a>
    </div>
  </div>
</section>

<!-- WHY CUB SCOUTING -->
<section class="max-w-6xl px-4 py-16 mx-auto">
  <div class="grid items-center gap-10 md:grid-cols-2">
    <div>
      <h2 class="text-3xl font-extrabold tracking-wide uppercase sm:text-4xl text-cub-blue">Why Cub Scouting?</h2>
      <p class="mt-4 text-lg leading-7">
        Scouting America welcomes every family to discover outdoor adventure, community, and character. In Pack {{ site.pack.number }},
        kids build confidence and leadership through hands-on experiences — and have a blast doing it.
      </p>
      <ul class="mt-6 space-y-3">
        <li class="flex items-start gap-3"><span class="mt-1">🌲</span> <span>Family campouts, hikes, and outdoor skills</span></li>
        <li class="flex items-start gap-3"><span class="mt-1">🧪</span> <span>STEM, crafts, and curiosity-driven learning</span></li>
        <li class="flex items-start gap-3"><span class="mt-1">🤝</span> <span>Friendship, teamwork, and service to our neighborhood</span></li>
        <li class="flex items-start gap-3"><span class="mt-1">✨</span> <span>Kindergarten through 5th grade, with a den for every age</span></li>
      </ul>
      <div class="mt-6">
        <a href="{{ '/about/' | relative_url }}" class="inline-flex items-center px-5 py-3 font-semibold text-white transition rounded-lg bg-slate-900 hover:bg-slate-800">
          Learn About Pack {{ site.pack.number }}
        </a>
      </div>
    </div>
    <div class="grid grid-cols-2 gap-4">
      <!-- Swap in your own images -->
      <img src="{{ '/assets/images/placeholders/craft.svg' | relative_url }}" alt="" class="object-cover w-full h-48 rounded-xl" loading="lazy" decoding="async">
      <img src="{{ '/assets/images/placeholders/service.svg' | relative_url }}" alt="" class="object-cover w-full h-48 rounded-xl" loading="lazy" decoding="async">
      <img src="{{ '/assets/images/placeholders/campfire.svg' | relative_url }}" alt="" class="object-cover w-full h-48 rounded-xl" loading="lazy" decoding="async">
      <img src="{{ '/assets/images/placeholders/regatta.svg' | relative_url }}" alt="" class="object-cover w-full h-48 rounded-xl" loading="lazy" decoding="async">
    </div>
  </div>
</section>

<!-- WHAT WE DO -->
<section class="bg-slate-50">
  <div class="max-w-6xl px-4 py-16 mx-auto">
    <h2 class="text-3xl font-extrabold tracking-wide text-center uppercase sm:text-4xl text-cub-blue">What We Do</h2>
    <p class="max-w-2xl mx-auto mt-3 text-center">
      A quick look at a Pack {{ site.pack.number }} year.
    </p>
    <div class="grid gap-6 mt-10 sm:grid-cols-2 lg:grid-cols-4">
      <!-- Card -->
      <article class="overflow-hidden bg-white shadow-sm rounded-2xl ring-1 ring-slate-200">
        <img src="{{ '/assets/images/placeholders/outdoor.svg' | relative_url }}" alt="" class="object-cover w-full h-40" loading="lazy" decoding="async">
        <div class="p-4">
          <h3 class="font-bold">Outdoor Adventure</h3>
          <p class="mt-1 text-sm text-slate-600">A fall family campout in the foothills, district campouts, and summer camp at Camp Winton.</p>
        </div>
      </article>
      <article class="overflow-hidden bg-white shadow-sm rounded-2xl ring-1 ring-slate-200">
        <img src="{{ '/assets/images/placeholders/derby.svg' | relative_url }}" alt="" class="object-cover w-full h-40" loading="lazy" decoding="async">
        <div class="p-4">
          <h3 class="font-bold">Build & Race</h3>
          <p class="mt-1 text-sm text-slate-600">Pinewood Derby cars, Raingutter Regatta boats, and den projects where Scouts design, build, and test.</p>
        </div>
      </article>
      <article class="overflow-hidden bg-white shadow-sm rounded-2xl ring-1 ring-slate-200">
        <img src="{{ '/assets/images/placeholders/community.svg' | relative_url }}" alt="" class="object-cover w-full h-40" loading="lazy" decoding="async">
        <div class="p-4">
          <h3 class="font-bold">Community Service</h3>
          <p class="mt-1 text-sm text-slate-600">Park projects, the November Sock Drive, the Veterans Day Parade, and helping at the St. Mary Parish Festival.</p>
        </div>
      </article>
      <article class="overflow-hidden bg-white shadow-sm rounded-2xl ring-1 ring-slate-200">
        <img src="{{ '/assets/images/placeholders/fun.svg' | relative_url }}" alt="" class="object-cover w-full h-40" loading="lazy" decoding="async">
        <div class="p-4">
          <h3 class="font-bold">Fun & Friendship</h3>
          <p class="mt-1 text-sm text-slate-600">Monthly pack meetings with skits, songs, games, and awards — plus a family swim to open the year.</p>
        </div>
      </article>
    </div>
  </div>
</section>

<!-- BE PART OF THE PACK (Leaders + Dens) -->
<section class="max-w-6xl px-4 py-16 mx-auto">
  <div class="grid gap-12 lg:grid-cols-2">
    <!-- Leaders -->
    <div markdown="1">
      {% include leaders.md %}
</div>
    <!-- Den Finder / Schedule -->
    <div>
      <h2 class="text-3xl font-extrabold tracking-wide uppercase sm:text-4xl text-cub-blue">Find Your Den</h2>
      <p class="mt-3">Scouts meet in small dens by grade, and the whole pack gathers once a month. New families welcome — jump in anytime.</p>
      <div class="grid gap-4 mt-6">
        <div class="p-4 rounded-xl ring-1 ring-slate-200">
          <p class="font-semibold">Lions (K)</p>
          <p class="text-sm text-slate-600"><span class="tbd">Meeting day to confirm</span></p>
        </div>
        <div class="p-4 rounded-xl ring-1 ring-slate-200">
          <p class="font-semibold">Tigers (1)</p>
          <p class="text-sm text-slate-600"><span class="tbd">Meeting day to confirm</span></p>
        </div>
        <div class="p-4 rounded-xl ring-1 ring-slate-200">
          <p class="font-semibold">Wolves (2)</p>
          <p class="text-sm text-slate-600"><span class="tbd">Meeting day to confirm</span></p>
        </div>
        <div class="p-4 rounded-xl ring-1 ring-slate-200">
          <p class="font-semibold">Bears (3)</p>
          <p class="text-sm text-slate-600">2nd Thursday of the month, 6 pm</p>
        </div>
        <div class="p-4 rounded-xl ring-1 ring-slate-200">
          <p class="font-semibold">Webelos (4)</p>
          <p class="text-sm text-slate-600"><span class="tbd">Meeting day to confirm</span></p>
        </div>
        <div class="p-4 rounded-xl ring-1 ring-slate-200">
          <p class="font-semibold">Arrow of Light (5)</p>
          <p class="text-sm text-slate-600"><span class="tbd">Meeting day to confirm</span></p>
        </div>
        <div class="p-4 rounded-xl ring-1 ring-cub-blue/30 bg-white">
          <p class="font-semibold">Whole pack</p>
          <p class="text-sm text-slate-600">Pack meeting on the 4th Thursday of the month, 6:30–7:30 pm (occasionally moved for holidays)</p>
        </div>
      </div>
      <div class="mt-6">
        {% include contact-button.html label="Ask a Question" class="inline-flex items-center px-5 py-3 font-semibold text-white transition rounded-lg bg-slate-900 hover:bg-slate-800" %}
        <p class="mt-3 text-sm text-slate-500">
          or email <a href="mailto:{{ site.email }}" class="text-cub-blue underline decoration-cub-blue/30 underline-offset-2 hover:decoration-cub-blue">{{ site.email }}</a>
        </p>
      </div>
    </div>
  </div>
</section>

<!-- FINAL CTA -->
<section class="max-w-6xl px-4 py-16 mx-auto text-center bg-slate-50">
  <h2 class="text-3xl font-extrabold tracking-wide uppercase sm:text-4xl text-cub-blue">Ready to Explore?</h2>
  <p class="mt-3">New to Scouting? We’ll help you get started. Come visit a pack meeting first — no commitment.</p>
  <div class="mt-6">
    <a href="{{ '/join/' | relative_url }}" class="inline-flex items-center px-6 py-3 font-bold transition bg-yellow-400 rounded-xl text-cub-blue hover:bg-yellow-300">
      Join Pack {{ site.pack.number }}
    </a>
  </div>
</section>
