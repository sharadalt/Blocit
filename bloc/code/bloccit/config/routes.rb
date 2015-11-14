Rails.application.routes.draw do
  get 'welcome/index'
  get 'posts/index'

  get 'posts/show'

  get 'posts/new'

  get 'posts/edit'
  
  resources :posts
  
  get "welcome/index"
  get "welcome/about"
  get 'about' => 'welcome#about'
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes"

  get 'welcome/about'
  root to: 'welcome#index'
end

