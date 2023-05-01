Rails.application.routes.draw do
  get 'home/index'
  resources :employees, only: %i[new create]

  root 'home#index'
end
