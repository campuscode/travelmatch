Rails.application.routes.draw do
  resources :trip_plans do
    resources :itineraries
  end
end
