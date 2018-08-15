require 'test_helper'
require 'net/http'

class DataRequestTest < ActiveSupport::TestCase
  setup do
    # @raw_json = File.open(Rails.root.join("test/fixtures/files/request.json")).read
    # @data = JSON.parse("http://calendar.libraryweb.org/ajax/calendar/list?c=-1&perpage=100&page=1&date=0000-00-00")
    # url = URI.parse('http://calendar.libraryweb.org/ajax/calendar/list?c=-1&perpage=100&page=1&date=0000-00-00')
    # req = Net::HTTP::Get.new(url.to_s)
    # res = Net::HTTP.start(url.host, url.port) {|http|
    # http.request(req)}
    # @data = res.body
    @data = "not real data"
    # puts data
  end

  test "make request" do
    # data = JSON.parse("http://calendar.libraryweb.org/ajax/calendar/list?c=-1&perpage=100&page=1&date=0000-00-00")
    DataRequest.call(@data)
    # assert_difference "Campus.count", 14 do
    #   JsonToEvents.call(@raw_json)
    # end
  end

  # test "creates events" do
  #   assert_difference "Event.count", 20 do
  #     JsonToEvents.call(@raw_json)
  #   end
  # end
end