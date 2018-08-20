namespace :events do
  desc "Fetch all events, creating or updating in our DB"
  task fetch: :environment do
    DataRequest.call
  end
end
