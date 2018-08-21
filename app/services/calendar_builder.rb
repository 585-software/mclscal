require 'icalendar'

class CalendarBuilder
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
    Event.includes(:calendar).where(calendars: { foreign_id: ids }, end_at: (Date.today..(3.months.from_now))).order(start_at: :asc).each do |event|
      ical_event = Icalendar::Event.new
      ical_event.summary = event.title
      ical_event.description = event.description
      ical_event.dtstart = event.start_at
      ical_event.dtend = event.end_at
      ical_event.url = event.url
      ical_event.location = event.campus.name
      ical_cal.add_event(ical_event)
    end

    ical_cal

  end

end
