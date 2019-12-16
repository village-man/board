class HubsController < ApplicationController
  def index
    # セキュリティ問題はどうなのか
    @board = Board.find(params[:id])
    @hubs = @board.hubs
  end

  def new

  end
end
