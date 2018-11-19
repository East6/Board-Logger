Rails.application.routes.draw do
  root 'home#index'

  get    '/login',   to: 'sessions#new',     as: 'login'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy', as: 'logout'

  get  'users/new',    to: 'users#new',    as: 'user_new'
  post 'users/create', to: 'users#create', as: 'user_create'

  get 'boards/search', to: 'boards#search', as: 'boards_search'
  get 'boards/:id',  to: 'boards#index', as: 'board'
  get 'boards/show/:id', to: 'boards#show', as: 'boards_show'
  post 'boards/create', to: 'boards#create'

  post 'waves/create', to: 'wave#create', as: 'wave_create'
  post 'gmaps/create', to: 'gmap#create', as: 'gmap_create'
  post 'boards/createManner', to: 'boards#createManner', as: 'boards_createManner'
  post 'photos/create',  to: 'photos#create',  as: 'photo_create'
  post 'waves/mood', to: 'wave#createmood', as: 'mood_create'

  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships,       only: [:create, :destroy]
end
