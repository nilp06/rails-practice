Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'demo/index', to: 'demo#index', as: 'demo_index'
    end
  end
  namespace :buisness do
    resources :customers, only: %i[new create index update edit]
    get 'customers/:id/preview', to: 'customers#preview', as: 'customers_preview'
    delete 'customers/:id/delete_customer', to: 'customers#destroy', as: 'customers_delete'
    get 'customers/search', to: 'customers#search', as: 'customers_search'
  end
  resources :users, only: %i[new create]
  resources :sessions, only: %i[new create]
  resources :products do
    collection do
      get 'filter/:flag', to: 'products#filter', as: 'filter'
      get 'order/list', to: 'orders#list', as: 'order_list'
      get 'order/filter', to: 'orders#filter', as: 'order_filter'
    end
    resources :orders
  end

  get 'sessions/destroy', to: 'sessions#destroy', as: 'logout'
  get 'home/index'
  scope '/queries' do
    get 'task1', to: 'queries#task1', as: 'task1'
    get 'task2', to: 'queries#task2', as: 'task2'
    get 'task3', to: 'queries#task3', as: 'task3'
    get 'task4', to: 'queries#task4', as: 'task4'
  end

  root 'home#index'
end
