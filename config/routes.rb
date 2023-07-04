Rails.application.routes.draw do
  devise_for :users
  resources :members
  resources :heads
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "heads#index"
end
