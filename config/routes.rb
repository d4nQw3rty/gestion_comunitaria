Rails.application.routes.draw do
  devise_for :users
  resources :members
  resources :heads
  resources :users
  root "heads#index"
  get '/reports/eligible_members', to: 'reports#eligible_members'
end
