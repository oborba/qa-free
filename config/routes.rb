Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  resources :register_user
  root 'projects#index'

  resources :projects do
    resources :test_plans do
    	resources :test_cases
    end
    resources :test_cases
  end
end
