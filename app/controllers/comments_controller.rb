class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    return unless @comment.save

    redirect_to item_path(params[:item_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
