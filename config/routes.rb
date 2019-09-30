Rails.application.routes.draw do
  get 'restaurant_categories/new'
  root "home#index"
  resources :restaurants, :users, :restaurant_categories
  
  get "admin_registration", to: "users#admin_registration"
  get "profile", to: "users#show"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "auth/:provider/callback", to: "sessions#create"
  delete "sign_out", to: "sessions#destroy", as: "sign_out"
end