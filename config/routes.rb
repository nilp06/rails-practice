Rails.application.routes.draw do
  resources :products
  get 'orders/', to: 'orders#index', as: 'all_orders'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'home#index'
end
