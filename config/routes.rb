Rails.application.routes.draw do
  
  root 'index#index'

  devise_for :users

  resources :index
  resources :notice  
end
