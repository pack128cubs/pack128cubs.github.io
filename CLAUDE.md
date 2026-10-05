# CLAUDE.md

Guidance for Claude Code when working in this repository.

## What this is

Jekyll static site for Cub Scout Pack 128 (East Sacramento, CA; Golden Empire Council; chartered by St. Mary School). Adapted from the Pack 57 Palo Alto site under its Scouting America Non-Commercial License (share-alike, attribution required: keep the credit in README.md and the footer).

## Commands

- Preview in Docker: `script/serve-docker.sh [port]` (image `ruby:3.4`, gems cached in `vendor/bundle`)
- With local Ruby: `bundle install`, `bundle exec jekyll serve`, `bundle exec jekyll build`
- No test suite.

## Architecture

- Jekyll 4 + TailwindCSS v4 via `jekyll-tailwindcss` (`_tailwind.css` holds theme tokens and component classes; `assets/css/styles.tailwindcss` is the output placeholder).
- Pack-specific facts live in `_config.yml` under `pack:` and `links:`; pages read them as `site.pack.*` / `site.links.*`.
- Events: `_plugins/events_from_data.rb` turns `_data/events.yml` into `/events/<slug>/` pages whose `page.event` matches the Google Calendar API event shape. `events.json` feeds FullCalendar on `/calendar/`; `index.md` builds "Coming Up" from the same pages. `jekyll-google-calendar` can replace the data file later (see README).
- All-day events store an exclusive end date (Google convention). Display code steps back half a day; see `_includes/event-when.html`.
- Every internal link and asset path goes through `relative_url` so the site works under a project-pages base path.
- `.github/workflows/pages.yml` builds and deploys to GitHub Pages, and rebuilds daily.

## Content rules

- Never add a youth's name. Leaders are first name + last initial.
- Den events get `audience: members` so locations stay private.
- Do not invent pack facts (dues, dates, places). Mark unknowns with `<span class="tbd">…</span>`.
- `draft_banner: true` in `_config.yml` keeps the site unindexed until the committee approves launch.
