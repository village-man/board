class BoardsController < ApplicationController
  def index
    @boards = Board.all
    @board = Board.new
  end

  def edit
    @board = Board.find(params[:id])
  end

  def update
    board = Board.find(params[:id])
    board.update!(board_params)
    redirect_to boards_url, notice: "掲示板「#{board.name}」を更新しました。"
  end

  def show
    @board = Board.find(params[:id])
  end

  def create
    @board = Board.new(board_params)
    if @board.save
      redirect_to @board, notice: "掲示板「#{@board.name}」を作成しました。"
    else
      @boards = Board.all
      render :index
    end
  end

  def destroy
    board = Board.find(params[:id])
    board.destroy
    redirect_to boards_url, notice: "掲示板「#{board.name}」を削除しました。"
  end

  private

    def board_params
      params.require(:board).permit(:name, :description)
    end

end
