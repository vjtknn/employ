Rails.application.routes.draw do
  devise_for :users
  root 'pages#index'

  resources :jobs
  resources :employees
  resources :departments
end
