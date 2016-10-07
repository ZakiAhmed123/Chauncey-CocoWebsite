Rails.application.routes.draw do


  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount Payola::Engine => '/payola', as: :payola

  root 'products#home'

  get 'collection' => 'products#collection', as: :collection
  get 'about-us' => 'products#about', as: :about
  get 'contact-us' => 'products#contact', as: :contact
  get 'policies' => 'products#policies', as: :policies


  get 'apparel' => 'products#apparel', as: :products
  get 'apparel/:id' => 'products#view', as: :product

  get 'gifts' => 'gifts#index', as: :gifts
  get 'gifts/:id' => 'gifts#view', as: :gift

  get 'jewelry' => 'jewels#index', as: :jewels
  get 'jewelry/:id' => 'jewels#view', as: :jewel

# add to cart
  post 'cart' => 'carts#add_to_cart', as: :add_to_cart
  get 'cart' => 'carts#view', as: :cart
  delete 'cart' => 'carts#remove_from_cart', as: :remove_from_cart



  #ORDER PROCESSING I.E. CHECKOUT
  get 'checkout' => 'checkout#payment', as: :checkout
  post 'checkout' => 'checkout#process_payment', as: :process_payment
  get 'shipping' =>  'checkout#shipping', as: :shipping
  post 'shipping' => 'checkout#process_shipping', as: :process_shipping

  get 'receipts/:id' => 'checkout#receipt', as: :receipt

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
