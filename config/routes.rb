Crowd::Application.routes.draw do

  resources :users do
    resource :playlists, :only => ['show', 'edit', 'update']
  end

  resources :sessions
  resources :identities


  match "/auth/:provider/callback", to: "sessions#create"
  match "/auth/failure", to: "sessions#failure"
  match "/logout", to: "sessions#destroy", :as => "logout"

  get '/playlists/new', to: 'playlists#new', :as => 'new_playlist'

  get "playlists/index"

  root :to => 'playlists#index'
end
