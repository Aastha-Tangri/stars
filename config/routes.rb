require 'sidekiq/web'

Rails.application.routes.draw do
  get 'employees/index'

  devise_for :employees

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)#, controllers: {registrations: "users/registrations", sessions: "users/sessions", passwords: "users/passwords", omniauth_callbacks: "users/omniauth_callbacks"}, skip: [:sessions, :registrations]
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'employees#index'
  resources :employees, only: :index do
    resources :points, :only => [:index, :create, :new]
  end

  mount Sidekiq::Web, at: '/sidekiq'
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
  
  #->Prelang (user_login:devise/stylized_paths)
  #  devise_scope :employee do
  #    get    "login"   => "employees/sessions#new",         as: :new_employee_session
  #    post   "login"   => "employees/sessions#create",      as: :employee_session
  #    delete "signout" => "employees/sessions#destroy",     as: :destroy_employee_session
  #    
  #    get    "signup"  => "employees/registrations#new",    as: :new_employee_registration
  #    post   "signup"  => "employees/registrations#create", as: :employee_registration
  #    put    "signup"  => "employees/registrations#update", as: :update_employee_registration
  #    get    "account" => "employees/registrations#edit",   as: :edit_employee_registration
  #  end

end
