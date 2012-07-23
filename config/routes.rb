Tipp5::Application.routes.draw do
  
  devise_for :admins

  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users

  # match 'games/add_result' => 'games#add_result'
  resources :cups do
    resources :rounds do
    end
  end

  resources :games do
    collection do
      get :result_index
    end
    member do
      get :fix_result
      put :save_result
    end
  end
  
  resources :bets

  resources :posts

  resources :teams

  resources :communities
  
  root :to => 'pages#home'

  match '/admin',     :to => 'pages#admin'
  match '/userpage',  :to => 'pages#userpage'
  match '/adminpage', :to => 'pages#adminpage'
  match '/about',     :to => 'pages#about'
  match '/rules',     :to => 'pages#rules'
  match '/impressum', :to => 'pages#impressum'
  
  match '/abgabe',    :to => 'bets#abgabe'
  match '/uebersicht', :to => 'bets#index'
  match '/ranking',   :to => 'bets#ranking'

  match '/news',      :to => 'posts#news'

  match '/join',      :to => 'communities#join'
  match '/leave',     :to => 'communities#leave'
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
