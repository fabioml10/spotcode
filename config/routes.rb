Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  get 'home/index'

  #rotas reaproveitaveis, passa para o resourses songs como parametro
  concern :favoritable do |options|
    shallow do
      post "/favorite", { to: "favorites#create", on: :member }.merge(options)
      delete "/favorite", { to: "favorites#destroy", on: :member }.merge(options)
    end
  end

  #especifico para apis
  namespace :api, defaults: { format: :json } do
    namespace :v1 do

      resources :dashboard, only: :index
      resources :categories, only: %i[index show]
      resources :search, only: :index

      resources :albums, only: :show do
        #rota: /api/v1/albums/:id/recently_heards, ou seja, fica aninhada ao album
        resources :recently_heards, only: :create
      end

      resources :favorites, only: :index

      resources :songs, only: [] do
        concerns :favoritable, favoritable_type: 'Song'
      end

    end
  end

end
