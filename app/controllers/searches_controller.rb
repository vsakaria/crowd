class SearchesController < ApplicationController

  def search
    @search = Search.new(params[:artist])
    @songs = @search.do_search

    respond_to do |format|
      format.js
      format.html
    end
  end
end