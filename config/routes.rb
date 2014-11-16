Rails.application.routes.draw do
  resources :order_items

  devise_for :users
  get 'pages/welcome'

  resources :warehouses

  resources :products

  resources :users

  resources :orders do
    member do
      # get 'change_status'
      post 'add_product'
    end
    collection do
      delete 'destroy_product/:order_item_id', to: 'orders#destroy_product', as:'destroy_product'
    end 
  end
  resources :shops

  resources :pages

  root "pages#welcome"

end
