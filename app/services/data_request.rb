require 'net/http'

class DataRequest
  API_URL = URI.parse(
    "http://calendar.libraryweb.org/ajax/calendar/list?c=-1&perpage=100&page=%d&date=0000-00-00"
  ).freeze

  # Set arguments here
  def initialize
  end

  # * means capture all arguments and keep them in an array called "args"
  def self.call
    # This calls initialize, converting the args array back into arguments
    self.new.call
  end

  # Run logic here
  def call
    res = get_json_results

    JsonToEvents.call(res.body)

    result = JSON.parse(res.body)
    total_events = result["total_results"]

    iterations = total_events /  100

    i = 2

    while i <= iterations  do
      res = get_json_results(i)

      JsonToEvents.call(res.body)

      i +=1
    end

  end

  private

  def get_json_results(page=1)
    req = Net::HTTP::Get.new(API_URL.to_s % page)
    Net::HTTP.start(API_URL.host, API_URL.port) do |http|
      http.request(req)
    end
  end


end
