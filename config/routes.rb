Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  # get    '/login',   to: 'sessions#new'
  # post   '/login',   to: 'sessions#create'
  # delete '/logout',  to: 'sessions#destroy'
  resources :items, only: :index
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
