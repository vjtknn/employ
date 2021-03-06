Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'pages#index'

  resources :jobs
  resources :employees
  resources :departments

  mount API::Core, at: "/"
  mount GrapeSwaggerRails::Engine => '/swagger'
end
