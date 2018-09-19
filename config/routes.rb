Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :movies, only: [:index, :create, :show]
      resources :people, only: [:show]
      resources :users, only: [:create]
      resources :sessions, only: [:create, :destroy]
      get 'me', to: 'me#index'
    end
  end
end
