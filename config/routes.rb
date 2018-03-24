Rails.application.routes.draw do
  root to: 'home#index'
  get '/search', to: 'home#index'
  resources :trip_plans, only: [:index,:show,:new,:create] do
  end

end
