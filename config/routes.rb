Rails.application.routes.draw do
  get "password_resets/new"
  get "password_resets/edit"
  root "static_pages#home"
  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/details", to: "artists#show"
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: %i(new create edit update)
  resources :categories
  resources :artists
  resources :albums
end
