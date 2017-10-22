Rails.application.routes.draw do

  root 'store#index', as: 'store'

  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }

  resources :items, only: [:show, :index]
  resources :categories, only: [:show, :index]
  resources :carts
  resources :line_items, only: [:create]
  resources :orders, only: [:show]

  post 'carts/:id/checkout', to: 'carts#checkout', as: 'checkout'

end
