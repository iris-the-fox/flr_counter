Rails.application.routes.draw do


  resources :groups do
    get 'show_column', on: :member
  end
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
        post "all_pages"
      end
      resources :messages 
    end
  end

  
end
