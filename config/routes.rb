Rails.application.routes.draw do
  get 'foods/new'
  get 'restaurant_categories/new'
  root "home#index"
  resources :users, :restaurant_categories

  resources :restaurants, only: [:show, :order_food, :new, :create] do 
    resources :foods
  end

  get "/orderfood", to: "restaurants#order_food", as: "/orderfood"
  
  get "admin_registration", to: "users#admin_registration"
  get "profile", to: "users#show"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "auth/:provider/callback", to: "sessions#create"
  delete "sign_out", to: "sessions#destroy", as: "sign_out"
end