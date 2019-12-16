class PagesController < ApplicationController
  def index
    @boards = Board.all
    @hubs = Hub.order("created_at DESC").limit(5)
  end
end
