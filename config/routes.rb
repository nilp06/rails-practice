Rails.application.routes.draw do
  # get 'products/index'
  # get 'products/:id', to: 'products#show'
  resources :products
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "products#index"
end
