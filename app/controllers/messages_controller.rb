class MessagesController < ApplicationController
  before_action :move_to_index, except: :index
  def index
    @group = Group.find(params[:group_id])
    @messages = Message.includes(:user, :comments, :favorites).where(group_id: params[:group_id])
    @comment = Comment.new
  end
  
  def new
    @group = Group.find(params[:group_id])
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.save
    flash[:notice] = "投稿が完了しました"
    redirect_to group_messages_path(params[:group_id])
  end

  def edit
    @group = Group.find(params[:group_id])
    @message = Message.find(params[:id])
  end

  def update
    @message = Message.find(params[:id])
    @message.update(message_params)
    redirect_to group_messages_path(params[:group_id])
    flash[:notice]= "記事を更新しました"
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    redirect_to group_messages_path(params[:group_id])
    flash[:notice]= "記事を削除しました"
  end

  def search
    @group = Group.find(params[:group_id])
    @messages = Message.search(params[:keyword])
    if @messages.length == 0
      flash.now[:notice] = "該当の記事がありません"
    end
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

