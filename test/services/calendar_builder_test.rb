require 'test_helper'

class CalendarBuilderTest < ActiveSupport::TestCase
  setup do
    @sample_library_ids = [7670]
    @raw_json = File.open(Rails.root.join("test/fixtures/files/request.json")).read
    JsonToEvents.call(@raw_json)

  end


  test "build_calendar" do
    CalendarBuilder.call(@sample_library_ids)
  end

end