Rails.application.routes.draw do
  get 'static_pages/home'
  get 'static_pages/help'
  get 'static_pages/about'
  
  get 'about', to: 'static_pages#about'
  get 'help', to: 'static_pages#help'

  root 'static_pages#home'
end
