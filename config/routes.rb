Rails.application.routes.draw do
  
  devise_for :users
 
  #root path
  root to:"home#index"
 
  get 'home/index'
  get 'home/about'
  get 'home/blog'
  get 'home/contacts'
 
  resources :order_shoes
  resources :shoes
  resources :orders
  resources :carts, only: [:index, :create, :destroy, :update]
end 
