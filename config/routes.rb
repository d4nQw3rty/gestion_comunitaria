Rails.application.routes.draw do
  resources :social_aids
  devise_for :users
  resources :members
  resources :heads
  resources :users
  root "heads#index"
  get '/reports/eligible_members', to: 'reports#eligible_members'
  get '/reports/clap', to: 'reports#clap'
  get '/reports/homeland', to: 'reports#homeland'
  get '/reports/amor_mayor', to: 'reports#amor_mayor'
  get '/reports/jose_gregorio_hernandez', to: 'reports#jose_gregorio_hernandez'
end
