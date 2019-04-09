Rails.application.routes.draw do
  resources :stories
  resources :groups
  devise_for :users
  root to: 'home#index'
  resources :flrs
end
