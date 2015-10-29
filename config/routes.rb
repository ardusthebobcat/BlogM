Rails.application.routes.draw do
  # You can have the root of your site routed with "root"
  root 'home#index'

  resources :posts, :except => [:index] do
    resources :tags, :except => [:index, :show]
  end

  resources :posts, only: [] do
    resources :comments
  end

  #allows for standalone tags
  resources :tags, :only =>[:index, :destroy]

  #allows for users
  resources :users

  #session/login route
  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  get "/logout" => "sessions#destroy", as: :logout
end
