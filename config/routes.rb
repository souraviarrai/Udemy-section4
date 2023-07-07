Rails.application.routes.draw do
  root "articles#home"
  resources :articles, only: [:show]
end
