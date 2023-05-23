Rails.application.routes.draw do
  resources :employees do
    member do
      get 'orders/increment', to: 'orders#increment', as: 'orders_increment'
      get 'orders/decrement', to: 'orders#decrement', as: 'orders_decrement'
    end
  end
  resources :users, only: %i[new create]
  resources :sessions, only: %i[new create]
  get 'employee/batch', to: 'employees#batch', as: 'employee_batch'
  get 'sessions/destroy', to: 'sessions#destroy', as: 'logout'
  get 'search', to: 'employees#search', as: 'search'
  get 'home/index'
  root 'home#index'
  get 'queries/show', to: 'queries#show', as: 'queries_show'
  get 'queries/perform', to: 'queries#perform', as: 'queries_perform'
end
