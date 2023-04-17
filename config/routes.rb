Rails.application.routes.draw do
  resources :users, only: %i[new create]
  resources :sessions, only: %i[new create]
  resources :products
  get 'sessions/destroy', to: 'sessions#destroy', as: 'logout'
  get 'home/index'
  root 'home#index'
end
