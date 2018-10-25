Rails.application.routes.draw do
  get "password_resets/new"
  get "password_resets/edit"
  root "static_pages#home"
  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/upload", to: "songs#new"
  get "/download/:id", to: "songs#download", as: :song_download
  get "/details", to: "artists#show"
  get "/song_album/:id", to: "albums#song_album", as: :song_album
  resources :users
  resources :account_activations, only: :edit
  resources :password_resets, only: %i(new create edit update)
  resources :categories
  resources :artists
  resources :albums
  resources :songs
end
