Rails.application.routes.draw do
  get 'home/index'
  resources :employees do
    get 'search', to: 'employees#search', as: 'search', on: :collection
  end
  root 'home#index'
end
