class MessagesController < ApplicationController
  def index
    @boards = Board.all
    @message = Message.new

    @hub = Hub.find(params[:hub_id])
    @board = @hub.board
    @messages = @hub.messages.order("created_at ASC")
  end

  def create
    @message = Message.new(message_params)
    if @message.save
       redirect_to messages_path(hub_id: message_params[:hub_id]), notice: "レスを作成しました。"
    else
      # @messages = Hub.all.order("created_at ASC")
      render :index
    end

  end

  def show
    @message = Message.find(params[:id])
    @board = Board.find(params[:board_id])
  end

  def edit
    @message = Message.find(params[:id])
  end

  def update
    message = Message.find(params[:id])
    message.update!(message_params)
    redirect_to message_path(message ,{board_id: message.hub.board.id}), notice: "メッセージを更新しました。"
  end

  def destroy
    message = Message.find(params[:id])
    message.destroy
    redirect_to hubs_url, notice: "メッセージを削除しました。"
  end

  private
    def message_params
      params.require(:message).permit(:user, :description, :hub_id, :created_at)
    end
end
