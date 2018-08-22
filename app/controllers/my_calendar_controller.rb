class MyCalendarController < ApplicationController
  def generate_url
    @calendars = Calendar.all.order(name: :asc)
  end

  def events
    ics_calendar = CalendarBuilder.call(calendar_ids)
    respond_to do |format|
      format.ics do
        render plain: ics_calendar.to_ical, layout: false
      end
    end
  end

  private

  def calendar_ids
    params[:calendar_ids].split(",")
  end
end
