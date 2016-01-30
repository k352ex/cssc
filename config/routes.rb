Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount Ckeditor::Engine => '/ckeditor' # 텍스트 편집기

  root 'index#index' # Root 경로

  devise_for :users, path: "auth", path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'sign_up' }

  resources :index
  resources :notice
  resources :question_answer

  resources :notice_comment
  resources :freeboard_comment

  resources :notice do
      resources :notice_comment
  end

  resources :board, controller: 'freeboard' do
    resources :freeboard_comment
  end # freeboard 경로 /board


end
