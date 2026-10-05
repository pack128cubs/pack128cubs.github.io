# Builds /events/<slug>/ pages from _data/events.yml.
#
# Each page carries `page.event` in the shape of a Google Calendar API event
# (summary, location, description, start/end holding either `date` or
# `dateTime`), which is what jekyll-google-calendar produces. Layouts,
# events.json and the homepage therefore work unchanged with either source.
require "date"
require "time"

module Pack128
  class DataEventPage < Jekyll::PageWithoutAFile
    def initialize(site, entry, slug, event)
      super(site, site.source, File.join("events", slug), "index.html")
      members = entry["audience"].to_s == "members"
      self.data = {
        "layout" => members ? "event-private" : "event-public",
        "title"  => entry["title"],
        "hideTitle" => true, # the event layouts print their own heading
        "event"  => event
      }
    end
  end

  class DataEventGenerator < Jekyll::Generator
    safe true

    DATE_ONLY = /\A\d{4}-\d{2}-\d{2}\z/

    def generate(site)
      Array(site.data["events"]).each do |entry|
        start_raw = entry["start"]
        next unless entry["title"] && start_raw

        all_day = date_only?(start_raw)
        start_day = all_day ? to_date(start_raw) : Time.parse(start_raw.to_s).to_date
        slug = "#{start_day.iso8601}-#{Jekyll::Utils.slugify(entry['title'])}"

        event = {
          "id"          => slug,
          "summary"     => entry["title"],
          "location"    => entry["location"],
          "description" => entry["description"],
          "start"       => all_day ? { "date" => start_day.iso8601 } : { "dateTime" => Time.parse(start_raw.to_s).iso8601 },
          "end"         => end_stamp(entry["end"], start_raw, all_day)
        }
        site.pages << DataEventPage.new(site, entry, slug, event)
      end
    end

    private

    def date_only?(value)
      (value.is_a?(Date) && !value.is_a?(DateTime)) || value.to_s.match?(DATE_ONLY)
    end

    def to_date(value)
      value.is_a?(Date) ? value : Date.parse(value.to_s)
    end

    # events.yml gives the last day of an all-day event; Google Calendar (and
    # FullCalendar) expect the day after, so add one.
    def end_stamp(end_raw, start_raw, all_day)
      if all_day
        { "date" => (to_date(end_raw || start_raw) + 1).iso8601 }
      else
        finish = end_raw ? Time.parse(end_raw.to_s) : Time.parse(start_raw.to_s) + 3600
        { "dateTime" => finish.iso8601 }
      end
    end
  end
end
