Rails.application.routes.draw do
  resources :orders do
    member do
      get :update_status
      get :cancel_order
      get :show_partial
    end  
  end  


  resources :items
  resources :restaurants
  resources :areas
  resources :cities

# get "/order/show_partial", to: "orders#show_partial"
  
 get '/restaurant_items', to: 'items#restaurant_items',as:'restaurant_items'
	# devise_scope :user do
	# 	root to: "devise/sessions#new"
	# end
	root "landing_page#index"
  devise_for :users


  Rails.application.routes.draw do
  get "/landing_page/admin", to: "landing_page#admin", as: "admin"
  get "/landing_page/user", to: "landing_page#user", as: "user"
  get "/landing_page/resto", to: "landing_page#resto", as: "resto"

  get "/landing_page/filter_areas", to: "landing_page#filter_areas"
  
  
  # root 'homes#index'
  # devise_scope :user do
  #   authenticated :user do
  #     # root :to => 'homes#cashier_option'
  #   end
  # end
  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
