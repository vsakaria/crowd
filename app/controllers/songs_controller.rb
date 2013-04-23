class SongsController < ApplicationController

  def index
    @songs = current_user.songs.all
  end

  def new
  end

  def create
    logger.debug
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
      format.html { redirect_to playlists_url}
      format.js { render songs_url }
      format.json { head :no_content, status: 200 }
    end
  end
end
