Rails.application.routes.draw do
  resource :session
  
  # Manual route definitions for users
  match '/users/new', to: 'users#new', via: :get, as: 'new_user'
  match '/users', to: 'users#create', via: :post, as: 'users'
  
  resources :ingredients
  
  root "ingredients#index"
  
  get "up" => "rails/health#show", as: :rails_health_check
end