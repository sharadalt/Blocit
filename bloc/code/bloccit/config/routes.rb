Rails.application.routes.draw do
<<<<<<< HEAD
  get 'posts/index'

  get 'posts/show'

  get 'posts/new'

  get 'posts/edit'
  
  resources :posts
  
  get "welcome/index"
  get "welcome/about"
  get 'about' => 'welcome#about'
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
=======
  get 'welcome/index'
>>>>>>> checkpoint_25

  get 'welcome/about'

<<<<<<< HEAD
<<<<<<< HEAD
  root to: 'welcome#index'
  #root to: 'welcome#contact'
  #root to: 'welcome#faq'
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
=======
   root to: 'welcome#index'
  #root to: 'welcome#contact'
  #root to: 'welcome#faq'
  #root to: 'welcome#about'
>>>>>>> bb2fe0795aebba22a96a6760839bcc152a1d9586
=======
  root to: 'welcome#index'
  
>>>>>>> checkpoint_25
end

