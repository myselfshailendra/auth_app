Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'dashboard#index'
  resources :users, only: :create
  get '/sign_up', to: 'users#new', as: :sign_up
  get '/sign_in', to: 'sessions#new', as: :sign_in
  delete '/sign_out', to: 'sessions#destroy', as: :sign_out
  resources :sessions, only: :create
  resources :dashboard, only: :index
end
