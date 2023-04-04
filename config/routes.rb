Rails.application.routes.draw do
  get 'home/index'
  resources :events
  resources :users, only: %i[new create]
  resources :sessions, only: %i[new create]
  resources :profiles, only: %i[edit show update]
  get 'events/enroll/:id', to: 'events#enroll', as: 'events_enroll'
  get 'sessions/destroy', to: 'sessions#destroy', as: 'logout'
  get 'currentuser/event', to: 'events#currentuser_event', as: 'currentuser_event'
  get 'currentuser/enrolled', to: 'events#enrollments', as: 'enrolled_event'
  root 'home#index'
end
