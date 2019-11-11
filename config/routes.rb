Rails.application.routes.draw do
  get 'labels/new'
  root 'sessions#new'
  resources :tasks
  resources :labels
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [ :new, :create, :show]
  namespace :admin do
    resources :users
  end
end
