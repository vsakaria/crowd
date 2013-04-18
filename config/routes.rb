Crowd::Application.routes.draw do


  get "songs/new"

  resources :users do
    resources :playlists, :only => ['show', 'edit', 'update']

    # get '/playlists/:id', to: 'playlists#user_show'
    # get '/playlists/:id/edit', to: 'playlists#user_edit'
    # put '/playlists/:id', to: 'playlists#user_update'
  end

  resources :sessions
  resources :identities


  match "/auth/:provider/callback", to: "sessions#create"
  match "/auth/failure", to: "sessions#failure"
  match "/logout", to: "sessions#destroy", :as => "logout"

  # get '/playlists/new', #to: 'playlists#new', :as => 'new_playlist'
  resources :playlists

  get "/search", to: "searches#search"

  root :to => 'playlists#index'
end
