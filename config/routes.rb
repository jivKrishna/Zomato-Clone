Rails.application.routes.draw do
  root "home#index"
  resources :users
  get "/admin/registration", to: "users#admin_registration", as: :admin_registration
  get "profile", to: "users#show", as: "profile"
  resources :restaurants
  # get "login", to: redirect("sessions#create_viewer"), as: "/auth/google_oauth2"
  get "auth/:provider/callback", to: "sessions#create"
  get "auth/failure", to: redirect("/")
  delete "sign_out", to: "sessions#destroy", as: "sign_out"
end