Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  get '/search', to: 'search#index'
  get 'my_plans', to: 'trip_plans#my_plans',  as: 'my_plans'
  resources :trip_plans, only: [:index,:show,:new,:create] do
    resources :itineraries do
        resources :meals, only: [:new, :create]
        resources :tourist_spots, only: [:new, :create]
        resources :accommodations, only: [:new, :create]
    end
    resources :matches, shallow: true do
      post 'accept', to: 'matches#accept'
      post 'reject', to: 'matches#reject'
    end
  end
  resources :matches, only: [:index]
end
