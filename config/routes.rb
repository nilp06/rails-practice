Rails.application.routes.draw do
  resources :employees
  resources :users, only: %i[new create]
  resources :sessions, only: %i[new create]
  get 'sessions/destroy', to: 'sessions#destroy', as: 'logout'
  get 'search', to: 'employees#search', as: 'search'
  get 'home/index'
  get 'orders/:id/update/:flag', to: 'orders#change', as: 'order_change'
  root 'home#index'
end
