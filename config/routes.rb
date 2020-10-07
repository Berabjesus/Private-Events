# frozen_string_literal: true

Rails.application.routes.draw do
  resources :events, only: %i[new index show create]
  resources :users, only: %i[new create show]
  resources :attendances, only: %i[create destroy]
  resources :sessions, only: %i[new create destroy]
  get '/users', to: 'users#new'
  post '/sessions', to: 'sessions#create'
  root to: 'events#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
