Rails.application.routes.draw do
  root 'home#index'

  get    '/login',   to: 'sessions#new',     as: 'login'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy', as: 'logout'

  get 'explain/explain'
  get 'boards/search', to: 'boards#search', as: 'boards_search'
  get 'boards/my_page',  to: 'boards#index', as: 'board'
  get 'boards/show/:id', to: 'boards#show', as: 'boards_show'
  resources :boards, only: [:create, :destroy]

  post 'waves/create', to: 'wave#create', as: 'wave_create'
  post 'gmaps/create', to: 'gmap#create', as: 'gmap_create'
  post 'photos/create',  to: 'photos#create',  as: 'photo_create'
  post 'waves/mood', to: 'wave#createmood', as: 'mood_create'

  resources :users
  resources :manners, only: [:create]
  resources :middles, only: [:create, :destroy]
end
