Rails.application.routes.draw do
  root 'users#new'

  get 'dashbord', to: 'users#index' , as: 'dashbord'

  # get 'dashbord', to: 'users#index', as: 'dashbord'
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'users#login', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  get 'notifications/new'
  post 'notifications/create' => 'notifications#create', as: "sendsms"


  resources :users
  resources :sessions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
