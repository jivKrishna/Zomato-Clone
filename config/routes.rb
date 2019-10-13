Rails.application.routes.draw do
  root "home#index"

  resources :users, only: [ :create, :edit, :update ] 
  resources :restaurant_categories, only: [ :index, :create, :update, :destroy ]

  resources :restaurants, only: [ :show, :new ] do 
    resources :food_items, only: :index do 
      resources :order_items, only: [ :create, :update, :destroy ]
    end

    resources :food_items, only: [ :show,   :create,  :edit,      :update, :destroy ]
    resources :reviews,    only: [ :create, :edit,    :update,    :destroy ]
    resources :orders,     only: [ :index,  :show,  :destroy, :place_order, :delivered ]
    resources :tables,     only: [ :index,  :new,     :create,    :edit,   :update, :destroy ]
    resources :menu_cards, only: [ :index,  :create,  :edit,      :update, :destroy ]
    resources :photos,     only: :index

    get "/place_order", to: "orders#place_order"
    get "reviews/:id/approve_review", to: "reviews#approve_review", as:"approve_review"
  end

  resources :restaurants, only: [ :index, :create, :edit, :update, :destroy ]
  
  get "profile", to: "users#show"
  get "/signup", to: "users#new"
  delete "sign_out", to: "sessions#destroy", as: "sign_out"
  post "sign_in", to: "sessions#create", as: "sign_in"
  get "auth/:provider/callback", to: "sessions#create_from_socialmedia"
end