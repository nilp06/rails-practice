Rails.application.routes.draw do
  get 'home/index'
  resources :cars
  resources :users, only: %i[new create]
  resources :sessions, only: %i[new create]
  get 'sessions/destroy', to: 'sessions#destroy', as: 'logout'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'home#index'
end
