Rails.application.routes.draw do
  resources :attendances
  resources :finances
  resources :events
  resources :members
  resources :permissions
  resources :events
  resources :organizations
  resources :members
  resources :members
  root 'pages#home'

  resources :members do
    member do
      get :delete
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'auth/:provider/callback', to: 'sessions#googleAuth'
  get 'auth/failure', to: redirect('/')
end
