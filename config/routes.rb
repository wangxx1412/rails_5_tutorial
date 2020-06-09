Rails.application.routes.draw do
  resources :images
  devise_for :users
  get 'welcome/index'

  resources :articles do
    resources :comments
  end

  root 'welcome#index'

  resources :about, only: [:index]
  namespace :admin do
    root to: 'dashboard#show'
    resources :products, except: [:edit, :update, :show]
  end
end
