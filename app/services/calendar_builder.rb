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
  	Icalendar::Calendar.new.tap do |ical_cal|
    Event.includes(:calendar, :campus).where(
        calendars: { foreign_id: ids },
        end_at: (Date.today..(3.months.from_now))
      ).order(start_at: :asc).each do |event|
        Icalendar::Event.new.tap do |ical_event|
          ical_event.summary = event.title
          ical_event.description = strip_tags(event.description)
          ical_event.dtstart = event.start_at
          ical_event.dtend = event.end_at
          ical_event.url = event.url
          ical_event.location = event.campus.name
          ical_cal.add_event(ical_event)
        end
      end
    end
  end

end
