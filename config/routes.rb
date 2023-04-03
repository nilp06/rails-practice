Rails.application.routes.draw do
  resources :events
  resources :users, only: %i[new create]
  resources :sessions, only: %i[new create]
  get 'sessions/new'
  get 'sessions/destroy', to: 'sessions#destroy', as: 'logout'
  root 'events#index'
end
