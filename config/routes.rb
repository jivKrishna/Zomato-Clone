Rails.application.routes.draw do
  root "home#index"

  resources :users, only: [ :show, :create, :edit, :update ] 
  resources :restaurant_categories, only: [ :index, :create, :update, :destroy ]
  resources :food_categories, only: [ :index, :create, :update, :destroy ]

  resources :restaurants, only: [ :show, :new ] do 
    resources :food_items, only: :index do 
      resources :order_items, only: [ :create, :update, :destroy ]
    end

    resources :food_items, except: :index
    resources :reviews,    except: [ :show, :index ]
    resources :orders,     only: [ :index,  :show,  :destroy, :edit, :update, :delivered ]
    resources :booking_tables,     except: :show
    resources :menu_cards, except: :show
    resources :photos,     only: :index

    get "/place_order", to: "orders#place_order"
    get "reviews/:id/approve_review", to: "reviews#approve_review", as:"approve_review"
  end

  resources :restaurants, except: :show
  
  get "/profile/:id", to: "users#show"
  get "/signup", to: "users#new"
  delete "*/signout", to: "sessions#destroy", as: "/signout"
  post "/sign_in", to: "sessions#create", as: "/sign_in"
  get "auth/:provider/callback", to: "sessions#create_from_socialmedia"
end