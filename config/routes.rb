Rails.application.routes.draw do
  get 'foods/new'
  get 'restaurant_categories/new'
  root "home#index"
  resources :users, :restaurant_categories, :sessions

  resources :restaurants, only: [:show, :order_food, :new, :create] do 
    resources :food_items do 
      resources :order_items
    end
    resources :reviews, only: [:create, :edit, :update, :destroy, :approve_review]
    resources :tables
    resources :orders
    resources :menu_cards
    resources :photos
    get "/place_order", to: "orders#place_order"
    put "/delivered/:id",   to: "orders#delivered"
    get "reviews/:id/approve_review", to: "reviews#approve_review", as:"approve_review"
  end

  resources :restaurants, only: [:index, :edit, :destroy, :update]
  
  get "profile", to: "users#show"
  get "/signup", to: "users#new"
  match "auth" => "users#auth", via: [:get, :post]
  delete "sign_out", to: "sessions#destroy", as: "sign_out"

  get "auth/:provider/callback", to: "sessions#create_from_socialmedia"
end