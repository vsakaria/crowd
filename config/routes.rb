Crowd::Application.routes.draw do

  resources :users


  get "playlists/index"

  root :to => 'playlists#index'
end
