class PlaylistsController < ApplicationController
  def index
    @playlist = Playlist.find_by_id(params[:user_id])
  end

  def new
    @playlist = Playlist.new 
  end

  def create
    @playlist = Playlist.new(params[:playlist])
    @playlist.save
  end

   def edit
    @playlist = Playlist.find(params[:id])
  end

  def show
    @playlist = Playlist.find(params[:id])
  end

  def update
    @playlist = Playlist.find(params[:id])
    @playlist.update_attributes(params[:playlist])
    
  end

  def destroy
    @playlist = Playlist.find(params[:id])
    @playlist.destroy
  end
end
