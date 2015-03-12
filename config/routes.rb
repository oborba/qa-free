Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  root 'projects#index'

  resources :projects do
    resources :test_plans
  end
  resources :tests
end
