Rails.application.routes.draw do
  namespace :admin do
    resources :users
  end
  root to: 'task#index'
  resources :task
end