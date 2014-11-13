Rails.application.routes.draw do
  resources :order_items

  devise_for :users
  get 'pages/welcome'

  resources :warehouses

  resources :products

  resources :users

  resources :orders

  resources :shops

  resources :pages

  root "pages#welcome"
end
