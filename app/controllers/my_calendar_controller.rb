class MyCalendarController < ApplicationController
  def generate_url
    @calendars = Calendar.all
  end

  def events
    ics_calendar = CalendarBuilder.call(library_ids)
    respond_to do |format|
      format.ics do
        render plain: ics_calendar.to_ical, layout: false
      end
    end
  end

  private

  def library_ids
    params[:library_ids].split(",")
  end
end
