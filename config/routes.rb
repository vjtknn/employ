Rails.application.routes.draw do
  root 'pages#index'

  resources :jobs
  resources :employees
  resources :departments
end
