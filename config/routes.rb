Rails.application.routes.draw do
  resources :recipe_foods
  devise_for :users
  resources :foods
  resources :recipes, only: [:index, :show, :new, :create, :destroy, :update] do
    member do
      post 'toggle_public'
    end
    resources :recipe_foods, only: [:index, :show, :new, :create, :destroy, :edit, :update]
  end

  root 'recipes#public_recipes'

  get 'general_shopping_list', to: 'home#shopping_list'
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
