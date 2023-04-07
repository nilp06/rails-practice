Rails.application.routes.draw do
  get 'comments/index'
  get 'comments/new'
  get 'comments/edit'
  get 'home/index'
  resources :events
  resources :users, only: %i[new create]
  resources :sessions, only: %i[new create]
  resources :profiles, only: %i[edit show update]
  get 'events/enroll/:id', to: 'events#enroll', as: 'events_enroll'
  get 'sessions/destroy', to: 'sessions#destroy', as: 'logout'
  get 'currentuser/event', to: 'events#currentuser_event', as: 'currentuser_event'
  get 'currentuser/enrolled', to: 'events#enrollments', as: 'enrolled_event'
  get 'event/filter/category', to: 'events#filter', as: 'event_filter'
  get 'comments/:id', to: 'comments#index', as: 'all_comments'
  get 'comment/new/:id', to: 'comments#new', as: 'new_comment'
  post 'comment/create/:id', to: 'comments#create', as: 'create_comment'
  get 'comment/likes/:id', to: 'likes#index', as: 'all_likes'
  get 'comment/like/add/:id', to: 'likes#add', as: 'add_like'
  root 'home#index'
end
