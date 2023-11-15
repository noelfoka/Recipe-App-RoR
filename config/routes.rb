Rails.application.routes.draw do
  devise_for :users
  resources :foods
  root 'home#index'
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
