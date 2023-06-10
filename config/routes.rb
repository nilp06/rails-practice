Rails.application.routes.draw do
  get 'home/index'
  resources :users, except: %i[destroy show]
  resources :sessions, only: %i[new create]
  get 'logout', to: 'sessions#destroy', as: 'logout'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'home#index'
end
