# Pack 128 Website

A Jekyll-based website for Cub Scout Pack 128 of East Sacramento, CA (Golden Empire Council, chartered by St. Mary School).

**Status: draft / proof of concept.** `draft_banner: true` in `_config.yml` shows a draft bar on every page and blocks search engines. Photos are placeholders, and details highlighted in amber (`<span class="tbd">`) still need to be supplied.

## Credit

The design and code are adapted from the [Pack 57 Palo Alto website](https://github.com/Pack57PaloAlto/pack57paloalto.github.io), © 2025 Friends of Pack 57 and Jacob Foster Heimark, which they generously license to other Scouting America units. This repository is distributed under the same Scouting America Non-Commercial License (see [LICENSE](LICENSE)). The den mascot avatars in `assets/images/leaders/` are also from the Pack 57 repository, resized. Changes from the original: Pack 128 content, a data-file event source, GitHub Pages deployment, placeholder artwork, and base-URL-safe links.

## Where things live

| To change… | Edit… |
|---|---|
| Pack name, city, contact email, outside links | `_config.yml` (`pack:` and `links:`) |
| Events | `_data/events.yml` (or connect Google Calendar, below) |
| Leader list | `_data/leaders.yml` (first name + last initial only) |
| Home, About, Join, Register, Parents pages | `index.md`, `about.md`, `join.md`, `register.md`, `parents.md` |
| Header, footer, navigation | `_layouts/default.html` |
| Photos | `assets/images/` (replace the files in `placeholders/`, or add your own and update the `src`) |
| Pack shield and chest mark | `assets/images/brand/`, cut from the shirt art (see Brand marks below) |
| Which chest mark is shown | `brand.chest_mark` in `_config.yml` (`mark` = round emblem, `mark-rect` = rectangular mountain-and-icons version) |

## Privacy rules for this site

- Never publish a youth's name, and never caption a photo with one.
- Only use photos of Scouts whose parents have given photo permission.
- Leaders are listed by first name and last initial, with their agreement.
- Den meeting locations stay off the site: give those events `audience: members`.
- No personal phone numbers or home addresses. Contact goes through the pack email.

## Preview locally

With Docker (no Ruby needed):

```
script/serve-docker.sh
```

Or with Ruby 3.4 and Bundler installed:

```
bundle install
bundle exec jekyll serve
```

The site is then at `http://localhost:4000`.

## Deployment

Pushing to `main` builds the site with GitHub Actions and publishes it to GitHub Pages (`.github/workflows/pages.yml`). One-time setup in the GitHub repository: **Settings → Pages → Build and deployment → Source: GitHub Actions**.

The workflow also rebuilds once a day so finished events drop off the homepage.

## Google Calendar

Events currently come from `_data/events.yml`. To have the site follow the pack's Google Calendar instead:

1. Create a service account in Google Cloud Console and download its JSON key.
2. Share each pack calendar with the service account's email address (read-only).
3. Add the key as a repository secret named `GCALENDAR_KEY_JSON`, and add a workflow step that writes it to `gcalendar-key.json` before the build (see the Pack 57 repository's workflow for the exact step).
4. In `Gemfile` and `_config.yml`, un-comment `jekyll-google-calendar` and fill in the `gcalendar:` block with the calendar IDs.
5. Change the workflow schedule to every 15 minutes so new events appear promptly.

Use layout `event-public` for the pack calendar and `event-private` for den calendars; the private layout hides locations.

## Brand marks

The shield and the round chest emblem come from the pack's print-ready shirt art by Commuter Industries (`JP_PK128_Apparel_V1.ai`, September 2026). The original file stays in `brand-source/`, which is ignored by git and by the site build so the print-ready vectors are not published.

To regenerate the web versions (needs poppler and Pillow):

```
pdftoppm -r 300 -png brand-source/JP_PK128_Apparel_V1.ai /tmp/pk128
python3 script/make-brand-marks.py /tmp/pk128-1.png assets/images/brand
```

That writes `shield.png`, `mark.png`, white versions of each for dark backgrounds, and `favicon.png`. `mark-rect.png` and `mark-rect-white.png` are the earlier rectangular chest design, kept as an alternative.

## Image optimization

Built images are shrunk during deployment by `script/optimize-images.sh`, which also strips metadata (including GPS location) from photos. Originals in the repository are left untouched.
