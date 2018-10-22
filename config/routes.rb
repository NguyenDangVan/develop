Rails.application.routes.draw do
  root "static_pages#home"
  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/details", to: "artists#show"
  resources :users
  resources :categories
  resources :artists
end
