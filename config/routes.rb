Rails.application.routes.draw do
  root 'pages#index'

  resources :jobs
end
