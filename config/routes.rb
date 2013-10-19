PullTracker::Application.routes.draw do
  root 'home#index'
  devise_for :users
  resources :users
  resources :pulls
  resources :pull_lists
  resources :pull_manifests
end
