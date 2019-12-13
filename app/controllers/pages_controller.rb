class PagesController < ApplicationController
  def index
    @boards = Board.all
  end
end
