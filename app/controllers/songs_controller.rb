class SongsController < ApplicationController

  def index
    @songs = current_user.songs.all
  end

  def new
  end

  def create
  
    @song = Song.new(params[:song])
    if @song.save
      respond_to do |format|
        format.js
      end
    else
      render :new
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    respond_to do |format|
      format.js    
    end
  end
end
