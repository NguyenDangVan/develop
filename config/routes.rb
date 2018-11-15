Rails.application.routes.draw do
  devise_for :users,
    controllers:{omniauth_callbacks: "users/omniauth_callbacks"}
  as :user do
    get "signin", to: "devise/sessions#new"
    post "signin", to: "devise/sessions#create"
    delete "signout", to: "devise/sessions#destroy"
  end
  mount Ckeditor::Engine => "/ckeditor"
  require "sidekiq/web"
  mount Sidekiq::Web => "/sidekiq"
  root "static_pages#home"
  get "/upload", to: "songs#new"
  get "/download/:id", to: "songs#download", as: :song_download
  get "/details", to: "artists#show"
  get "/song_album/:id", to: "albums#song_album", as: :song_album

  namespace :admin do
    resources :categories, only: :index
    resources :songs do
      resources :lyrics, only: %i(new create destroy)
    end
    resources :users
    resources :artists, only: :index
    resources :albums, only: :index
    resources :dashboards, only: :index
    resources :charts, only: :index
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
    get "/activities", to: "activities#index"
  end
  resources :favorites, only: %i(create destroy)
  resources :playlist_songs, only: %i(create destroy)
  delete "/playlist_songs", to: "playlist_songs#destroy"
  resources :albums
  resources :songs do
    resources :lyrics, only: %i(new create destroy)
  end

  get "/comments/new(:parents_id)", to: "comments#new", as: :new_comment
  resources :comments

end
