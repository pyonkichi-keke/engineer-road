class CommentsController < ApplicationController
  before_action :move_to_index 
  
  def create
    @comment = Comment.create(comment_params)
    flash[:notice] = "コメントを投稿しました"
    redirect_to  group_message_path(params[:group_id], params[:message_id])
  end

  def new
    @group = Group.find(params[:group_id])
    @message = Message.find(params[:message_id])
    @comment = Comment.new
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
