Rails.application.routes.draw do
  resources :users, only: %i[new create]
  resources :sessions, only: %i[new create]
  resources :tweets, except: %i[show]
  get 'sessions/destroy', to: 'sessions#destroy', as: 'logout'
  get 'home/welcome'
  root 'home#index'
end
