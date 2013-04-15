Crowd::Application.routes.draw do

  resources :users
  resources :sessions


  get "playlists/index"

  root :to => 'playlists#index'
end
