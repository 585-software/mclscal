class MyCalendarController < ApplicationController
  def events
    ics_calendar = CalendarBuilder.call(params[:library_ids])
    respond_to do |format|
      format.ics do
        render plain: ics_calendar.to_ical, layout: false
      end
    end
  end
end
