require 'test_helper'

class JsonToEventsTest < ActiveSupport::TestCase
  setup do
    @raw_json = File.open(Rails.root.join("test/fixtures/files/request.json")).read
  end

  test "creates campuses" do
    assert_difference "Campus.count", 14 do
      JsonToEvents.call(@raw_json)
    end
  end

  test "creates events" do
    assert_difference "Event.count", 20 do
      JsonToEvents.call(@raw_json)
    end
  end
end
