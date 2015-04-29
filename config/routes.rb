Rails.application.routes.draw do
  get 'djs', to: 'welcome#index'
  get 'promoters', to: 'promoters#index'
  get 'promoters/:slug', to: 'promoters#show', as: :promoter

  get 'ratings/update'
  resources :genres, only: [:new, :create]
  resources :users, only: :show
  resources :events, only: [:new, :create, :destroy]
  post :claim_event, to: 'events#claim_event'
  get 'venues/:slug', to: 'venues#show', as: :venue
  resources :venues, only: [:new, :create, :index]
  resources :ratings, only: [:update, :destroy, :create]
  resources :comments, only: :update do
    resources :replies, only: [:create, :destroy, :update]
  end

  resources :djs, only: [:create]

  get 'djs/:slug', to: 'djs#show', as: :dj
 
  get 'dj-form', to: 'welcome#dj_form'
  get 'about', to: 'welcome#about'
  post 'set-dj', to: 'welcome#set_dj'

  root 'venues#index'
  post :send_contact_email, to: 'djs#send_contact_email', as: :send_contact_email
  post :contact_us, to: 'welcome#contact_us', as: :contact_us
  
  get '/auth/facebook/callback', to: 'sessions#create'
  get '/auth/facebook', as: 'login'
  delete '/logout', to: 'sessions#destroy'
  get 'search'  => 'searches#index'
  get 'search_venues' => 'searches#venue_index'
  get '/api', to: 'api#index'
  get '/api/djs', to: 'api#djs'
  get '/api/djs/:id', to: 'api#show_dj'
  post 'ratings/:id', to: 'ratings#create'



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
