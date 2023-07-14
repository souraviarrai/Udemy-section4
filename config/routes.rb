Rails.application.routes.draw do
  root 'land#landingpage'
  resources :articles
  resources :users
  get 'signup', to: 'users#new'
  # get 'login', to: 'sessions#new'
  # post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :sessions, only: %w[new create]
end