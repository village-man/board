class PagesController < ApplicationController
  def index
    @boards = Board.all
    @hubs = Hub.order("created_at ASC").limit(10)
  end
end
