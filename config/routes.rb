Rails.application.routes.draw do

  devise_for :admins
  devise_for :users
  resources :register_user
  root 'projects#index'

  resources :projects do
    resources :test_plans do
      resources :test_cases
      resources :bugs
    end
    resources :bugs
    resources :test_cases
  end
end
