Rails.application.routes.draw do
  # Rutas de autenticación
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  # Registro de usuarios
  resources :users, only: [:new, :create]
  get 'signup', to: 'users#new'

  # Rutas para tasks
  resources :tasks

  # Define la ruta raíz
  root 'tasks#index'

  # Health check
  get "up" => "rails/health#show", as: :rails_health_check
end