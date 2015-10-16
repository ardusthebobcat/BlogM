Rails.application.routes.draw do
  # You can have the root of your site routed with "root"
  root 'posts#index'

  resources :posts, :except => [:index] do
    resources :tags, :except => [:index, :show]
  end

  resources :tags, :only =>[:index, :destroy]
end
