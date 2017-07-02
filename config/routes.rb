Rails.application.routes.draw do
  root 'sessions#new'


  get 'sessions/new'
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  get 'notifications/create'
  post 'notifications/create' => 'notifications#create', as: "sendsms"


  resources :users
  resources :sessions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
