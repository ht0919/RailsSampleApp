require 'sidekiq/web'

Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users
  root 'home#index'
  authenticate :user, ->(u) { u.admin? } do
    mount Sidekiq::Web, at: '/sidekiq'
  end
  resources :posts, only: [:create] 
end
