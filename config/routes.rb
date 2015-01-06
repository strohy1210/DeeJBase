Rails.application.routes.draw do
  resources :genres, only: [:new, :create]

  resources :events, only: [:new, :create, :destroy]
  resources :venues, only: [:new, :create, :index]
  resources :ratings, only: :update
  resources :djs, only: [:create, :update, :index]
  get 'djs/:name', to: 'djs#show'
  get 'dj-form', to: 'welcome#dj_form'
  get 'about', to: 'welcome#about'
  post 'set-dj', to: 'welcome#set_dj'

  root 'welcome#index'
  post :send_contact_email, to: 'djs#send_contact_email', as: :send_contact_email
  post :contact_us, to: 'welcome#contact_us', as: :contact_us
  
  get '/auth/facebook/callback', to: 'sessions#create'
  get '/auth/facebook', as: 'login'
  delete '/logout', to: 'sessions#destroy'
  get 'search'  => 'searches#index'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
