Rails.application.routes.draw do
  root 'pages#index'
  resources :boards
  resources :hubs
  resources :messages
end
