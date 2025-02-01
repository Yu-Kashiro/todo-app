class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    board = Board.find(params[:board_id])
    task = Task.find(params[:task_id])
    @comment = task.comments.build(comment_params)
    if @comment.save
      binding.pry
      redirect_to board_task_path(board,@comment), notice: '作成できました'
    else
      flash.now[:error] = '作成できませんでした'
      render :new
    end
  end


  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end