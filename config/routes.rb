Rails.application.routes.draw do
  resources :houses, only: [:create, :index, :show, :update, :destroy]
  resources :sellers, only: [:create, :show]
  resources :users, only: [:create, :show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
