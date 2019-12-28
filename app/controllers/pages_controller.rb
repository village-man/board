class PagesController < ApplicationController
  def index
    @boards = Board.all
    @board_all = Board.find_by(name: 'ALL')
    @hubs = Hub.order("created_at ASC").limit(10)
  end
end
