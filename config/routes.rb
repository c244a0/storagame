Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'
  resources :posts do
    resource :relationships, only: [:create, :destroy]
    get :followings, on: :member
    get :followers, on: :member
  end
  resources :users do
    resource :relationships, only: [:create, :destroy]
    get :followings, on: :member
    get :followers, on: :member
  end
  resources :games, only: [:new, :create, :show]
  resources :grades, only: :show

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
