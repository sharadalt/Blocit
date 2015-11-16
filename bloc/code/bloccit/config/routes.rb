  Rails.application.routes.draw do
      get 'welcome/index'
      get 'welcome/about'
      
    
      # The priority is based upon order of creation: first created -> highest priority.
      # See how all your routes lay out with "rake routes"
    
       root to: 'welcome#index'
       get 'welcome/index'
       get 'welcome/about'
       get 'welcome/faq'
       get 'posts/show'
       get 'posts/new'
       get 'posts/edit'
       
       resources :posts
      #root to: 'welcome#contact'
      #root to: 'welcome#faq'
      #root to: 'welcome#about'
end

