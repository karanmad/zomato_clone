Rails.application.routes.draw do
  root "users#index"
  get "signup", to: "users#new" 
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  get "logout" => "sessions#destroy"
  get "auth/:provider/callback", to: "sessions#google_fb_create"
  
  resources :users, except: [:new, :destroy]
  resources :admin_dashboards, only: [:index] 

  resources :restaurants do
    member do
      get "map"
      get "upload_image"
      patch "upload"
      get "menu"
    end
      get "list", on: :collection
  end

  resources :categories, only: [:new, :create]
  resources :food_items, except: [:show] 
  resources :orders, only: [:create, :index] 
  resources :book_tables, only: [:new, :create, :index]

  resources :cart_items, only: [:update, :destroy] do
    post "add", on: :collection
  end

  resources :reviews, except: [:index] do
    get "unapprove", on: :collection
    member do
      patch "approve_request"
      delete "reject"
    end
  end
  
  get "cart", to: "carts#show"
  get "error", to: "admin_dashboards#error"
  
  resources :promotions do
    collection do
      get "active"
      get "expired"
      get "discount_ascend"
      get "discount_descend"
      get "date_ascend"
      get "date_descend"
    end
  end

end