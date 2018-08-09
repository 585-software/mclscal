class JsonToEvents
  attr_reader :json

  # Set arguments here
  def initialize(json)
    @json = json
  end

  def self.call(*args)
    self.new(*args).call
  end

  # Run logic here
  def call
    parsed_json["results"].each do |event_hash|
      campus = Campus.where(name: event_hash["campus"]).first_or_create!
      Event.create!(
        campus: campus,
        title: event_hash["title"],
        description: event_hash["description"],
        url: event_hash["url"],
        foreign_id: event_hash["id"],
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
