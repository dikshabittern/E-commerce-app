Rails.application.routes.draw do
  devise_for :users
  resources :categories
  resources :products

  root 'products#index'


  namespace :admin, module: nil  do
    root "admin#index"
    resources :users
  end
  get 'category/:id/products' => "products#index"

  get 'product/:id' => "products#product_details"
  get 'products_all' => "products#all_product"

  resources :products do
  	get "/wishlist", action: :add_wishlist, as: :add_wishlist
    # get "/cart/:id", action: :add_to_cart, as: :add_to_cart
    get "/cart" => "products#add_to_cart"
  end

  delete 'remove_wishlist_item/:id' => "products#remove_wishlist", as: :remove_wishlist
  delete 'remove_cart_item/:id' => "products#remove_cart", as: :remove_cart
  
  get '/wishlist' => "products#wishlist"
  get '/cart' => "products#cart"

end
