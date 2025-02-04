class BoardsController < ApplicationController
  before_action :authenticate_user!

  def index
    @boards = Board.all
  end

  def new
    @board = current_user.boards.build
  end

  def create
    @board = current_user.boards.build(board_params)
    if @board.save
      redirect_to boards_path, notice: '作成できました'
    else
      flash.now[:error] = '作成できませんでした'
      render :new
    end
  end

  def update
    @board = current_user.boards.find(params[:id])
    if @board.update(board_params)
      redirect_to root_path, notice: '更新できました'
    else
      flash.now[:error] = '更新できませんでした'
      render :edit
    end
  end

  def show
    @board = Board.find(params[:id])
    @tasks = @board.tasks.all
    # @comments = @board.comments.all
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