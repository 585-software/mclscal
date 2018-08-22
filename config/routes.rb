Rails.application.routes.draw do
  root to: "my_calendar#generate_url"
  get "my_calendar/events", format: :ics
  resources :calendars
  resources :campuses
  resources :events
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
