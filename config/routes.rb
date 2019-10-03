Rails.application.routes.draw do
  get 'foods/new'
  get 'restaurant_categories/new'
  root "home#index"
  resources :users, :restaurant_categories, :sessions

  resources :restaurants, only: [:show, :order_food, :new, :create] do 
    resources :foods
    resources :reviews, only: [:create,:edit, :update, :destroy, :approve_review]

    get "reviews/:id/approve_review", to: "reviews#approve_review", as:"approve_review"
  end

  get "/orderfood", to: "restaurants#order_food", as: "/orderfood"
  
  get "profile", to: "users#show"
  get "/signup", to: "users#new"
  get "/sign_in", to: "users#sign_in"
  match "auth" => "users#auth", via: [:get, :post]
  delete "sign_out", to: "sessions#destroy", as: "sign_out"

  get "auth/:provider/callback", to: "sessions#create_from_socialmedia"
end