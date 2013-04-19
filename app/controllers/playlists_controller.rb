class PlaylistsController < ApplicationController
  def index
    @playlist = Playlist.find_by_id(params[:user_id])
  end

  def new
    @playlist = Playlist.new
    # search = Search.new
    # search.create 
  end

  def create
   

   
    if @playlist.save
      redirect_to @playlist
      # redirect_to @playlist
    else
      render :new
    end
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
