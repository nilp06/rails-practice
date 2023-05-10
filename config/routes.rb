Rails.application.routes.draw do
  resources :users, only: %i[new create]
  resources :sessions, only: %i[new create]
  resources :posts do
    member do
      get 'like'
      get 'dislike'
    end
    resources :comments, only: [:create]
  end
  get 'sessions/destroy', to: 'sessions#destroy', as: 'logout'
  get 'home/index'
  root 'home#index'
end
