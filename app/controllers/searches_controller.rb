class SearchesController < ApplicationController

  def create
    @search = Search.new(params[:artist])
    @songs = @search.do_search
  end

  def index
  end

end