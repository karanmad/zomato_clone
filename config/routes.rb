Rails.application.routes.draw do
  root "users#index"
  resources :restaurants
  resources :users
  resources :sessions, only: [ :create ]
  
end
