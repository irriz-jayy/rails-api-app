Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :cart_items
      resources :carts
      resources :orders
      resources :products
      resources :users
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
