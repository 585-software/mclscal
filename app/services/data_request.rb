require 'net/http'

class DataRequest
  attr_reader :data

  # Set arguments here
  def initialize(data)
    @data = data
  end

  # * means capture all arguments and keep them in an array called "args"
  def self.call(*args)
    # This calls initialize, converting the args array back into arguments
    self.new(*args).call
  end

  # Run logic here
  def call
    # parsed_json["results"].each do |event_hash|
    #   # Find a Campus that matches the name, or create one
    #   campus = Campus.where(name: event_hash["campus"]).first_or_create!

    #   # Create an event
    #   Event.create!(
    #     campus: campus,
    #     title: event_hash["title"],
    #     description: event_hash["description"],
    #     url: event_hash["url"],
    #     foreign_id: event_hash["id"],
    #     start_at: DateTime.parse(event_hash["startdt"]),
    #     end_at: DateTime.parse(event_hash["enddt"]),
    #   )
    #end
    url_string = 'http://calendar.libraryweb.org/ajax/calendar/list?c=-1&perpage=100&page=%d&date=0000-00-00'
    url = URI.parse('http://calendar.libraryweb.org/ajax/calendar/list?c=-1&perpage=100&page=1&date=0000-00-00')
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) {|http|
    http.request(req)}

    JsonToEvents.call(res.body)
    
    result = JSON.parse(res.body)
    total_events = result["total_results"]

    puts total_events
    iterations = total_events /  100

    puts iterations
    
    puts iterations.round
    i = 2

    while i <= iterations  do
      puts("Inside the loop i = %d", i )

      url = URI.parse(url_string % [i])
      req = Net::HTTP::Get.new(url.to_s)
      res = Net::HTTP.start(url.host, url.port) {|http|
      http.request(req)}

      JsonToEvents.call(res.body)

      i +=1
    end

  end

  private

  def parsed_data
    data
  end
end
