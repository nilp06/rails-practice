Rails.application.routes.draw do
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :students
  resources :faculties
  # Defines the root path route ("/")
  root "students#index"
end
