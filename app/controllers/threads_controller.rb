class ThreadsController < ApplicationController
  def index
    @boards = Board.all
  end
end
