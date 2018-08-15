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

    puts parsed_data["total_results"]

    # JsonToEvents.call(data)
  end

  private

  def parsed_data
    data
  end
end
