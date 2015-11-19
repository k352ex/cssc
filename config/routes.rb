Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor' # 텍스트 편집기
  root 'index#index'

  devise_for :users, path: "auth", path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'sign_up' }
  resources :index
  resources :notice
  resources :freeboard
  resources :comments

end
