Rails.application.routes.draw do
  # get 'sessions/new'
  # get 'sessions/create'
  # get 'sessions/destroy'
  # get 'users/new'
  # get 'users/create'
  # get 'users/show'
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]
  root to: "users#new"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
