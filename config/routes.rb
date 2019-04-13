Rails.application.routes.draw do


  resources :groups
  resources :stories  do
   resources :reviews 		
  end
  devise_for :users
  root to: 'home#index'
  resources :flrs do
    member do
      post "retrieve_last_page"
    end
    resources :pages do
      collection do
        get "retrieve_pages"
        post "all_pages"
      end
    end    

    
    resources :messages do
      collection do
        get "retrieve_posts"
      end
    end
  end
end
