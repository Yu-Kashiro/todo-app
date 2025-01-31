class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    binding.pry
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end
end