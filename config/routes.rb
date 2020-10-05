Rails.application.routes.draw do
  resources :events, only: [:new, :index, :show, :create]
  resources :users, only: [:new, :create, :show]
  resources :invites, only: [:create, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
  get "/users", to: "users#new"
  post "/sessions", to: "sessions#create"
  root to: "events#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
