class MessagesController < ApplicationController
  before_action :move_to_index 
  def index
    @group = Group.find(params[:group_id])
    @messages = Message.includes(:group).where(group_id: params[:group_id])
  end
  
  def new
    @group = Group.find(params[:group_id])
    @message = Message.new
   
  end

  def create
    @message = Message.create!(message_params)
    flash[:notice] = "投稿が完了しました"
    redirect_to group_messages_path(params[:group_id])
  end

  def show
    @group = Group.find(params[:group_id])
    @message = Message.find(params[:id])
    @favorite = Favorite.find_by(user_id: current_user.id, message_id: params[:id])
    @favorites = Favorite.where(message_id: params[:id])
    @comments = @message.comments
    @user = User.find_by(id: @message.user_id)
  end

  def edit
    @group = Group.find(params[:group_id])
    @message = Message.find(params[:id])
  end

  def update
    @message = Message.find(params[:id])
    @message.update(message_params)
    redirect_to group_message_path(params[:group_id],params[:id])
  end


private
  def message_params
    params.require(:message).permit(:title, :content, :image).merge(group_id: params[:group_id], user_id: current_user.id)
  end
  
  def move_to_index
    unless user_signed_in?
      flash[:alert] = "ログインしてください"
      redirect_to root_path
    end
  end
end

