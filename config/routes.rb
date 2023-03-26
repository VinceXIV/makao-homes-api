Rails.application.routes.draw do
  resources :houses, only: [:create, :index, :show, :update, :destroy]
  resources :sellers, only: [:create, :show]
  resources :users, only: [:create, :show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  post '/sessions/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  post '/seller-login', to: 'seller_sessions#create'
  delete '/seller-logout', to: 'seller_sessions#destroy'
end
