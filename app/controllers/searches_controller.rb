class SearchesController < ApplicationController

  def create
    @search = Search.new(params[:artist])
    @search.do_search
  end

  def index

    @search.result
  end
end