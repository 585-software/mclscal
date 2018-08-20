class JsonToEvents
  attr_reader :json

  # Set arguments here
  def initialize(json)
    @json = json
  end

  # * means capture all arguments and keep them in an array called "args"
  def self.call(*args)
    # This calls initialize, converting the args array back into arguments
    self.new(*args).call
  end

  # Run logic here
  def call
    parsed_json["results"].each do |event_hash|
      # Find a Campus that matches the name, or create one
      campus = Campus.where(name: event_hash["campus"]).first_or_create!
      calendar = Calendar.where(foreign_id: event_hash["calendar_id"]).first_or_create!

      # Create an event
      Event.where(foreign_id: event_hash["id"]).first_or_create!(
        campus: campus,
        calendar: calendar,
        title: event_hash["title"],
        description: event_hash["description"],
        url: event_hash["url"],
        foreign_id: event_hash["id"],
        start_at: DateTime.parse(event_hash["startdt"]),
        end_at: DateTime.parse(event_hash["enddt"]),
      ).update(
        title: event_hash["title"],
        description: event_hash["description"],
        url: event_hash["url"],
        start_at: DateTime.parse(event_hash["startdt"]),
        end_at: DateTime.parse(event_hash["enddt"]),
        )
    end

  end

  private

  def parsed_json
    JSON.parse(json)
  end
end
