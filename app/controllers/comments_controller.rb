class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    board = Board.find(params[:board_id])
    task = Task.find(params[:task_id])
    @comment = task.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to board_task_path(board,task), notice: '作成できました'
    else
      flash.now[:error] = '作成できませんでした'
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :task_id, :user_id)
  end
end