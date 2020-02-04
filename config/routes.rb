Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: :create
  get '/sign_up', to: 'users#new', as: :sign_up
end
