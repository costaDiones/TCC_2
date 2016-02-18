Rails.application.routes.draw do
  resources :readings
  resources :readings
  resources :readings
  resources :readings
  resources :princes
  resources :consumptions
  resources :readings
  resources :calleds
  resources :problems
  resources :hydrometers
  resources :customers
    get 'control_users/index'

  resources :admins
  resources :posts
   devise_for :users, :controllers => {:registrations => "registrations"}



  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  devise_scope :user do
  get "editar", to: "devise/registrations#edit"
end
    root 'readings#index'


    get 'inicio' => 'pages#index'
    get 'usuarios' => 'control_users#index'
    get 'hidrometro' => 'hydrometers#index'
    get 'admin' => 'admins#index'
    get 'novohidrometro' => 'hydrometers#new'
    get 'mensagem' => 'problems#new'
    get 'mensagens' => 'problems#index'
    get 'novochamado' => 'calleds#new'
    get 'chamados' => 'calleds#index'
    get 'consumo' => 'readings#index'
    get 'novaleitura' => 'readings#new'
    get 'tabelaPrecos' => 'princes#index'
    get 'novatabela' => 'princes#new'





devise_scope :user do
    get "novousuario", to: "devise/registrations#new"
    get "login", to: "devise/sessions#new"
  end





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
