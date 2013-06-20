PullTracker::Application.routes.draw do
  root 'home#index'
  devise_for :users
  resources :users
  resources :pulls
end
