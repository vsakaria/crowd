Crowd::Application.routes.draw do

  resources :searches

  resources :users

  get "playlists/index"

  root :to => 'playlists#index'
end
