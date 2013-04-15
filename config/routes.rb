Crowd::Application.routes.draw do

  get "playlists/index"

  root :to => 'playlists#index'
end
