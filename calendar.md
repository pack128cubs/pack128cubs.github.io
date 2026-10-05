---
layout: default
title: Pack 128 Calendar
permalink: /calendar/
navbarText: Sacramento, CA
hideTitle: true
---

<section class="mx-auto max-w-6xl px-4 py-10">
  <div class="flex items-baseline justify-between flex-wrap gap-2">
    <h2 class="text-2xl md:text-3xl font-extrabold tracking-wide uppercase text-cub-blue">Calendar</h2>
    <div class="text-sm text-slate-600 flex items-center gap-4">
      <span class="inline-flex items-center gap-1.5">
        <span class="inline-block w-3 h-3 rounded-sm" style="background:#1e3a8a"></span>
        Pack-wide
      </span>
      <span class="inline-flex items-center gap-1.5">
        <span class="inline-block w-3 h-3 rounded-sm" style="background:#ca8a04"></span>
        Den / Members
      </span>
    </div>
  </div>

  {% include calendar-widget.html %}

  <p class="mt-6 text-sm text-slate-600">
    Meeting places for den events are shared with members only. Details for every event also arrive by Scoutbook email.
  </p>

  {% if site.gcalendar.calendars or site.links.google_calendar != "" %}
  <div class="mt-8">
    <h3 class="text-lg font-bold tracking-wide uppercase text-slate-700">Subscribe in Google Calendar</h3>
    <p class="mt-2 text-sm text-slate-600">Open the calendar in Google Calendar to subscribe and get updates on your phone.</p>

    <div class="mt-4 flex flex-wrap gap-2">
      {% if site.links.google_calendar != "" %}
        <a href="https://calendar.google.com/calendar/render?cid={{ site.links.google_calendar | url_encode }}"
           target="_blank" rel="noopener noreferrer"
           class="inline-flex items-center rounded-lg px-3 py-2 text-sm font-medium ring-1 ring-slate-300 bg-white hover:bg-slate-50">
          🐾 Pack {{ site.pack.number }}
        </a>
      {% endif %}
      {% for cal in site.gcalendar.calendars %}
        {% if cal.name %}
        <a href="https://calendar.google.com/calendar/render?cid={{ cal.id | url_encode }}"
           target="_blank" rel="noopener noreferrer"
           class="inline-flex items-center rounded-lg px-3 py-2 text-sm font-medium ring-1 ring-slate-300 bg-white hover:bg-slate-50">
          {{ cal.name }}{% if cal.layout == 'event-private' %} (members){% endif %}
        </a>
        {% endif %}
      {% endfor %}
    </div>
  </div>
  {% endif %}
</section>
