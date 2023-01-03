Rails.application.routes.draw do
  scope '(locales)', locale: /en|gu|mr/ do
    get '/', to: 'home#index'
    devise_for :admin_users, ActiveAdmin::Devise.config
    ActiveAdmin.routes(self)

    devise_for :users

    # root path
    root to: 'home#index'

    get 'home/index'
    get 'home/about'
    get 'home/blog'
    get 'home/contacts'

    resources :order_shoes
    resources :shoes
    resources :orders
    resources :carts, only: %i[index create destroy update] do
      member do
        get :update_quantity
        get :update_size
      end
    end
  end
end
