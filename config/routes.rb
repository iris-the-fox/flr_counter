Rails.application.routes.draw do

  resources :groups do
  	resources :stories
  end
  devise_for :users
  root to: 'home#index'
  resources :flrs
end
