class HubsController < ApplicationController
  def index

    if params[:id].present?
      @boards = Board.all
      @board = Board.find(params[:id])
      @hubs = @board.hubs.page(params[:page]).per(10)
    else
      @boards = Board.all
      @board = Board.find_by(name: 'ALL')
      @hubs = Hub.page(params[:page]).per(10)
    end
  end

  def new
    @hub = Hub.new
    @boards = Board.all
  end

  def edit
    @hubs = Hub.find(params[:id])
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
       redirect_to hubs_path, notice: "ハブ「#{@hub.name}」を作成しました。"
    else
      @hub = Hub.all.order("created_at ASC")
      render :index
    end
  end

  def destroy
    hub = Hub.find(params[:id])
    hub.destroy
    redirect_to hubs_url, notice: "掲示板「#{hub.name}」を削除しました。"
  end

  private
    def hub_params
      params.require(:hub).permit(:name, :description, :board_id)
    end
end
