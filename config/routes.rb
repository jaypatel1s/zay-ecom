Rails.application.routes.draw do
  resources :order_shoes
  resources :shoes
  resources :orders
  resources :carts
  resources :users
  
  devise_for :users
  get 'home/index'
  get 'home/about'
  get 'home/blog'
  get 'home/contacts'
 
  root to:"home#index"
end
