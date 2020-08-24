class CommentsController < ApplicationController
  before_action :move_to_index 
  
  def create
    @comment = Comment.create(comment_params)
    respond_to do |format|
      format.json
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment).merge(message_id: params[:message_id], user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      flash[:alert] = "ログインしてください"
      redirect_to root_path
    end
  end

end


