Rails.application.routes.draw do
  get "favorites/destroy"
  get "favorites/create"
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

  namespace :admin do
    resources :categories, only: :index
    resources :songs, only: :index
    resources :users, only: :index
    resources :artists, only: :index
    resources :albums, only: :index
    resources :dashboards, only: :index
    root "dashboards#index"
  end
  resources :account_activations, only: :edit
  resources :password_resets, only: %i(new create edit update)
  resources :categories do
    resources :songs, only: :index
    resources :albums, only: %i(show index)
  end
  resources :artists do
    resources :songs, only: :index
  end
  get "/not_found", to: "static_pages#not_found"
  resources :users do
    member do
      get :favorite_songs
    end
    resources :playlists
  end
  resources :favorites, only: %i(create destroy)
  resources :playlist_songs
  resources :albums
  resources :songs
end
