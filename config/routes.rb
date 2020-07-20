Rails.application.routes.draw do
  resources :book_tables, except: [:show]
  get "table_booked", to: "book_tables#show"

  resources :orders, except: [:show]
  get "order", to: "orders#show", as: "order_show"
  
  root "users#index"
  resources :users, except:[:new]
  get "signup", to: "users#new"

  get "cart", to: "carts#show"
  resources :carts , except: [:show]

  post "cart_items/add"
  resources :cart_items

  resources :restaurants

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  get "logout" => "sessions#destroy"

  get "error", to: "pages#show"
  get "menu", to: "pages#menu"
  get "restaurant_list", to: "pages#index"
  get "upload_image", to: "pages#edit"
  patch "upload_image", to: "pages#update"

  resources :restaurant_categories

  resources :food_items

  resources :admin_dashboards

  resources :reviews
end