Rails.application.routes.draw do
  root "users#index"
  post "carts/add"
  resources :restaurants
  resources :users, except:[:new]
  get "signup", to: "users#new"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  get "logout" => "sessions#destroy" 
  get "error", to: "pages#show"
  get "menu", to: "pages#menu"
  resources :restaurant_categories
  resources :food_items
  resources :admin_dashboards
end