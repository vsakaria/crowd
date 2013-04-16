Crowd::Application.routes.draw do

  resources :users
  resources :sessions
  resources :identities

  match "/auth/:provider/callback", to: "sessions#create"
  match "/auth/failure", to: "sessions#failure"
  match "/logout", to: "sessions#destroy", :as => "logout"



  get "playlists/index"

  root :to => 'playlists#index'
end
