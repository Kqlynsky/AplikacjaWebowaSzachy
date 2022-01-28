Rails.application.routes.draw do
  root to: 'static#index'

  get    '/feed',   to: 'static#feed'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  get '/logout',  to: 'sessions#destroy'

  resources :players
end
