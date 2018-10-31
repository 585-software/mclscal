require 'icalendar'

class CalendarBuilder
  include ActionView::Helpers::SanitizeHelper

  attr_reader :ids

  # Set arguments here
  def initialize(ids)
  	@ids = ids
  end

  # * means capture all arguments and keep them in an array called "args"
  def self.call(*args)
    # This calls initialize, converting the args array back into arguments
    self.new(*args).call
  end

  # Run logic here
  def call
  	ical_cal = Icalendar::Calendar.new
    Event.includes(:calendar, :campus).where(
      calendars: { foreign_id: ids },
      end_at: (Date.today..(3.months.from_now))
    ).order(start_at: :asc).each do |event|
      ical_event = Icalendar::Event.new(
        summary: event.title,
        description: strip_tags(event.description),
        dtstart: event.start_at,
        dtend: event.end_at,
        url: event.url,
        location: event.campus.name,
      )
      ical_cal.add_event(ical_event)
    end

    ical_cal
  end

end
