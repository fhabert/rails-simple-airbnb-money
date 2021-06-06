Rails.application.routes.draw do
  devise_for :users
  root to: 'flats#index'

  get 'saved_houses', to: "flats#saved"
  post '/', to: "flats#index_update"
  
  resources :flats, except: :index 

  resources :orders, only: [:show, :create] do
    resources :payments, only: :new
  end

  resources :chatrooms, only: [:show, :create] do
    resources :messages, only: :create
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :flats, only: [:index, :show, :update, :create]
    end
  end

  require 'sidekiq/web'
  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  authenticate :user, ->(user) {user.admin?} do
    mount Blazer::Engine, at: "blazer"
  end
end
