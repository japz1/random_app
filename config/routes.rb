Rails.application.routes.draw do
  resources :patients
  root to: 'visitors#index'
  #root to: 'users/sign_in'
  devise_for :users
  resources :users
end
