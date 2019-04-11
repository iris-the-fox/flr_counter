Rails.application.routes.draw do


  resources :groups
  resources :stories  do
   resources :reviews 		
  end
  devise_for :users
  root to: 'home#index'
  resources :flrs
end
