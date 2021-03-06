Bundlebee::Application.routes.draw do

  #devise_for :users, :path => '', :path_names => { :sign_in => "login", :sign_out => "logout", :sign_up => "register" }
  
  namespace :api do
    namespace :v1 do
      devise_for :users, :path => '', :path_names => { :sign_in => "login" }
      resources  :apps
      resources  :users, :only => [:show, :create]
      match 'sandbox'                     => 'sandbox_items#index',       :via => :get
      match 'has_app/:app_id'             => 'sandbox_items#show',        :via => :get
      match 'add_to_sandbox/:app_id'      => 'sandbox_items#create',      :via => :post
      match 'remove_from_sandbox/:app_id' => 'sandbox_items#destroy',     :via => :delete
      match 'get_android_app_data'        => 'apps#get_android_app_data', :via => :get
      match 'add_app_to_db'               => 'apps#create',               :via => :post
    end
  end

  resources :sandbox_items, only: [:create, :destroy]

  devise_for :users


  resources :apps
  resources :users do
    resources :sandbox_items, only: [:create, :destroy]
  end
  
  root :to => "apps#index"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
