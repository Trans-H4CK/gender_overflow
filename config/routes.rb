GenderOverflow::Application.routes.draw do
  devise_for :users, :controllers => {:registrations => 'registrations'}

  devise_scope :user do
    get "/login" => "devise/sessions#new", :as => :login
    delete "/logout" => "devise/sessions#destroy", :as => :logout
    get "/sign_up" => "registrations#new", :as => :sign_up
    get "/reset_password" => "devise/passwords#new", :as => :reset_password
  end

  resources :questions do
    resources :answers, :only => [:new, :edit, :create, :update, :destroy] do
      member do
        post :'up-vote', :action => "up_vote", :as => :up_vote
        post :'down-vote', :action => "down_vote", :as => :down_vote
        put :'switch-vote', :action => "switch_vote", :as => :switch_vote
        delete :'delete-vote', :action => 'delete_vote', :as => :delete_vote
      end
    end
  end

  resources :categories

  namespace :chats do
    resource :global, :only => [:show], :controller => 'global'
    resources :categories, :only => [:show]
  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'static#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
