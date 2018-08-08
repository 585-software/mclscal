json.extract! event, :id, :foreign_id, :title, :description, :start_at, :end_at, :url, :campus_id, :created_at, :updated_at
json.url event_url(event, format: :json)
