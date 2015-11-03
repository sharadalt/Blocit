Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

   root to: 'welcome#index'
  #root to: 'welcome#contact'
  #root to: 'welcome#faq'
  #root to: 'welcome#about'
end
