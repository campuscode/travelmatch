Rails.application.routes.draw do
  root to: 'home#index'
  get '/search', to: 'search#index'
  resources :trip_plans, only: [:index,:show,:new,:create] do
    resources :itineraries do
        resources :meals, only: [:new, :create]
        resources :tourist_spots, only: [:new, :create]
        resources :accommodations, only: [:new, :create]
    end
  end
end
