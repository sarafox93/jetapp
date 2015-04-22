Rails.application.routes.draw do
  resources :stickies
  resources :comments
  resources :activities, only:[:index]
  # NOTE DO NOT ADD IDEAS AS RESOURCE
  
  resources :user_friendships do 
    member do 
      put :accept
    end
  end

  devise_for :users

  # You can have the root of your site routed with "root"
  # ideas controller with the show action 
  # ROOT IS ALSO NEEDED FOR DEVISE
  root 'ideas#showAll'

  get "profiles/showProfile"


  delete 'ideas/:id', to: 'ideas#delete', :as => :delete

  get 'ideas/showAll', to: 'ideas#showAll', :as => :showAll
  get 'ideas/showAuthorIdea', to: 'ideas#showAuthorIdea', :as => :showAuthorIdea
  get 'ideas/new', to: 'ideas#newIdea', :as => :newIdea
  post 'ideas/add', to: 'ideas#add', :as => :add            # Never need an get route, as we will never directly naviage to the add page. 

  get 'ideas/showBMC/:id', to: 'ideas#showBMC', :as => :showBMC

  # WHY WONT THIS WORK?
  # Do not need a get route, as we will never directly navigate to the delete page. 
  # post 'ideas/deleteLast', to: 'ideas#deleteLast', :as => :deleteLast

  # This is the old way of doing things, use get/post as opposed to match. 
  # match 'ideas/delete', :to => 'ideas#delete', :via => [:get, :post], :as=> :delete
  get 'idea/:id', to:'ideas#showIdea', :as => :showIdea
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  get '/:id', to: 'profiles#showProfile', :as => :showProfile

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
