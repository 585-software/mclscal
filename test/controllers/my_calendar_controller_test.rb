require 'test_helper'

class MyCalendarControllerTest < ActionDispatch::IntegrationTest
  test "should get events" do
    get my_calendar_events_url
    assert_response :success
  end

end
