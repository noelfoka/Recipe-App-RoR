Rails.application.routes.draw do
  resources :foods
  root 'home#index'
  resources :foods, only: [:index] #do
    # resources :foods, only: [:index, ]
      # resources :comments, only: [:new, :create, :destroy]
      # resources :likes, only: [:create] # Plural resources for handling likes
    # end
  #end
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
