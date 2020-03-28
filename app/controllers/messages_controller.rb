class MessagesController < ApplicationController
  def index
    @boards = Board.all
    @message = Message.new
    @hub = Hub.find(params[:hub_id])

    @board = @hub.board
    @messages = @hub.messages.where(deleted_tag: nil).order("hub_index ASC")
  end

  def create
    # 検証エラーをはくときのために、@messageを作成。
    @message = Message.new(message_params)
    @message.client_ip = request.remote_ip
    @message.agent = request.env["HTTP_USER_AGENT"]
    if @message.save
      redirect_to messages_path(hub_id: message_params[:hub_id]), notice: "レスを作成しました。"
    else
      @boards = Board.all
      @hub = Hub.find(message_params[:hub_id])
      @board = @hub.board
      @messages = @hub.messages.where(deleted_tag: nil).order("hub_index ASC")
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
    message.deleted_tag = 1
    message.save
    redirect_to '/', notice: "メッセージを削除しました。"
  end

  private
    def message_params
      params.require(:message).permit(:message_user_name, :description, :hub_id, :created_at, :parent_message_id, :mail_tag, :user_id)
    end
end
