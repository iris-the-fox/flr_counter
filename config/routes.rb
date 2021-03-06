Rails.application.routes.draw do

  devise_for :users
  root to: 'home#index'

  shallow do 
    resources :flrs do
      member do
        post "get_last_page"
      end
      resources :pages, exept: [:update, :edit] do
        collection do
          post "get_all_pages"
        end
        member do
          post "update_full_page"
        end
        resources :messages do
          collection do
            post "get_all_messages"
          end
        end
      end
      resources :groups do
        get 'show_column', on: :member
        resources :stories  do
          resources :reviews    
        end
      end
    end
  end
  
end
