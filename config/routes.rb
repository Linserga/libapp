Rails.application.routes.draw do
 get '/register', to: 'readers#new', as: 'register'
 match 'login', to: 'sessions#new', via: :get
 match 'logout', to: 'sessions#destroy', via: :delete
 
 resources :readers
 resources :sessions, only: [:new, :create, :destroy]

 root to: 'home#index'
end
