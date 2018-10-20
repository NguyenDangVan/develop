Rails.application.routes.draw do
  root "static_pages#home"
  get "users/new"
  root "static_pages#home"
end
