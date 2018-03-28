Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  get '/search', to: 'search#index'
  get 'my_plans', to: 'trip_plans#my_plans',  as: 'my_plans'
  resources :trip_plans, only: [:index,:show,:new,:create] do
    resources :matches, only: [:show, :new, :create], shallow: true
  end
end
