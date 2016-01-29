Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount Ckeditor::Engine => '/ckeditor' # 텍스트 편집기

  root 'index#index' # Root 경로

  devise_for :users, path: "auth", path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'sign_up' }

  resources :index
  resources :notice
  resources :notice_comment
  resources :board, controller: 'freeboard'
  resources :freeboard_comment
  resources :question_answer
end
