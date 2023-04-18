Rails.application.routes.draw do
  resources :customers
  resources :users, only: %i[new create]
  resources :sessions, only: %i[new create]
  resources :products do
    get 'filter/:flag', to: 'products#filter', on: :collection, as: 'filter'
    member do
      resources :orders
    end
  end
  get 'sessions/destroy', to: 'sessions#destroy', as: 'logout'
  get 'home/index'
  root 'home#index'
end
