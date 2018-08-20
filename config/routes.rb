Rails.application.routes.draw do
  resources :calendars
  resources :campuses
  root to: "events#index"
  resources :events
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
