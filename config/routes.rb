Rails.application.routes.draw do
  root 'pages#index'
  resources :threads
  resources :boards
end
