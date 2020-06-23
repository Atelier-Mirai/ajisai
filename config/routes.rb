Rails.application.routes.draw do
  root 'tasks#index'
  resources :tasks do
    # post :confirm, action: :confirm_new, on: :new
  end

  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  namespace :admin do
    resources :users
  end
end
