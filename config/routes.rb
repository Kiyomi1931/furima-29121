Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items
  resources :addresses, only: :create
  resources :items do
    resources :buys, only: [:index, :create]
  end
end
