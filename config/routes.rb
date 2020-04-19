Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  get 'home/index'

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

    end
  end

end
