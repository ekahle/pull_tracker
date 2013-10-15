PullTracker::Application.routes.draw do
  resources :pull_lists

  root 'home#index'
  devise_for :users
  resources :users
  resources :pulls
end
