class HubsController < ApplicationController
  def index
    @board_all = Board.find_by(name: 'ALL')
    p 3333333333333333
    p @board_all.id
    p params[:board_id]
    if params[:board_id] == "#{@board_all.id}"
      p 22222222222
      @boards = Board.all
      @board = @board_all
      @hubs = Hub.page(params[:page]).per(10)
    else
      p 111111111
      @boards = Board.all
      @board = Board.find(params[:board_id])
      @hubs = @board.hubs.page(params[:page]).per(10)
    end
  end

  def new
    @hub = Hub.new
    @boards = Board.where.not(name: 'ALL')
  end

  def edit
    @hub = Hub.find(params[:id])
    @boards = Board.where.not(name: 'ALL')
  end

  def update
    hub = Hub.find(params[:id])
    hub.update!(hub_params)
    redirect_to hubs_url, notice: "ハブ「#{hub.name}」を更新しました。"
  end

  def show
    @hub = Hub.find(params[:id])
  end

  def create
    @hub = Hub.new(hub_params)
    if @hub.save
      redirect_to hubs_path(board_id: @hub.board.id), notice: "ハブ「#{@hub.name}」を作成しました。"
    else
      @hub = Hub.all.order("created_at ASC")
      render :index
    end
  end

  def destroy
    hub = Hub.find(params[:id])
    hub.destroy
    redirect_to hubs_url, notice: "ハブ「#{hub.name}」を削除しました。"
  end

  private
    def hub_params
      params.require(:hub).permit(:name, :description, :board_id, :user_id)
    end
end
