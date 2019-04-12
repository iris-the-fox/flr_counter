Rails.application.routes.draw do


  resources :groups
  resources :stories  do
   resources :reviews 		
  end
  devise_for :users
  root to: 'home#index'
  resources :flrs do
    member do
      post "retrieve_pages"
    end

    
    resources :messages do
      collection do
        get "retrieve_posts"
      end
    end
  end
end
