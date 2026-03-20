Rails.application.routes.draw do
  get "dashboards/show"
  resources :batches
  resources :recipes
  resource :session

  # Manual route definitions for users
  match "/users/new", to: "users#new", via: :get, as: "new_user"
  match "/users", to: "users#create", via: :post, as: "users"

  resources :recipes
  resources :ingredients
  resources :inventory_items
  resources :batches, only: [ :index, :show, :new, :create, :destroy ]
  resources :favorites, only: [ :index ]

  post "recipes/:recipe_id/favorite", to: "favorites#create", as: "favorite_recipe"
  delete "recipes/:recipe_id/unfavorite", to: "favorites#destroy", as: "unfavorite_recipe"

  root "dashboards#show"

  get "up" => "rails/health#show", as: :rails_health_check
end
