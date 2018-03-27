Rails.application.routes.draw do
  root to: 'home#index'
  get '/search', to: 'search#index'
  resources :trip_plans, only: [:index,:show,:new,:create] do
    resources :itineraries
    resources :matches, shallow: true
  end
end
