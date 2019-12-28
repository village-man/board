Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root 'pages#index'
  resources :boards
  resources :hubs
  resources :messages
  resources :users, only: [:show]
  # get '/users/:id', to: 'users#show', as: 'user'
end
