class SongsController < ApplicationController
  def new
  end

  def create
    @song = Song.new(params[:song])
    if @song.save
      respond_to do |format|
        format.js
      end
      # redirect_to @song
    else
      render :new
    end
  end
end
