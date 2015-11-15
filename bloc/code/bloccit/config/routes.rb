Rails.application.routes.draw do
  get 'welcome/index'
  get 'welcome/about'
  

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes"

  get 'welcome/about'
  root to: 'welcome#index'
end

