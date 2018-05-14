Rails.application.routes.draw do
  get 'users/new'

  get 'static_pages/home'
  get 'static_pages/help'
  get 'static_pages/about'
  
  get 'about', to: 'static_pages#about'
  get 'help', to: 'static_pages#help'
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'

  root 'static_pages#home'
  
  resources :users
end
