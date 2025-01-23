class BoardsController < ApplicationController
  def index
    @boards = Board.all
  end

  def new
    @board = current_user.boards.build
  end

  def create
  end

  def update
    @board = current_user.boards.find(params[:id])
    if @board.update(board_params)
      redirect_to board_path(@board), notice: '更新できました'
    else
      flash.now[:error] = '更新できませんでした'
      render :edit
    end
  end

  def show
    @board = Board.find(params[:id])
  end

  def edit
    @board = Board.find(params[:id])
  end

  def destroy
    @board = current_user.boards.find(params[:id])
    @board.destroy
      redirect_to boards_path, notice: '削除できました'
  end

  private
  def board_params
    params.require(:board).permit(:title, :content, :deadline )
  end
end