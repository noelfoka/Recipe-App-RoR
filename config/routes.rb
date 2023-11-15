Rails.application.routes.draw do
  devise_for :users
  resources :foods
  resources :recipes, only: [:index, :show, :new, :create, :destroy] do
    member do
      post 'toggle_public'
    end
    resources :recipe_foods, only: [:index, :show, :new, :create, :destroy] 
  end
  root 'home#index'
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
