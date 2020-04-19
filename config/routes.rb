Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  get 'home/index'

  #especifico para apis
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :dashboard, only: :index
      resources :categories, only: :index
      resources :search, only: :index
    end
  end

end
