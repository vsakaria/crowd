class PlaylistsController < ApplicationController
  def index
    @playlists = Playlist.all
  end

  def new
    @playlist = Playlist.new
    # search = Search.new
    # search.create
  end

  def create
    @playlist = current_user.playlists.build(params[:playlist])
    if @playlist.save
      redirect_to @playlist
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
