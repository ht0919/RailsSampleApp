require 'sidekiq/web'

Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users
  root 'home#index'
  mount Sidekiq::Web, at: '/sidekiq'
  resources :posts, only: [:create] 
end
