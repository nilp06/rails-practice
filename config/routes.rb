Rails.application.routes.draw do
  resources :customers
  resources :users, only: %i[new create]
  resources :sessions, only: %i[new create]
  resources :products do
    get 'filter/:flag', to: 'products#filter', on: :collection, as: 'filter'
    resources :orders
  end
  get 'sessions/destroy', to: 'sessions#destroy', as: 'logout'
  get 'home/index'
  get 'queries/task1', to: 'queries#task1', as: 'task1'
  get 'queries/task2', to: 'queries#task2', as: 'task2'
  get 'queries/task3', to: 'queries#task3', as: 'task3'
  root 'home#index'
end
