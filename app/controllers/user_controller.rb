class UserController < ApplicationController
  before_action :move_to_index

  def show
    @messages = Message.includes(:user, :comments, :favorites).where(user_id: current_user.id)
    @favo_messages = Favorite.all.where(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      flash[:alert] = "ログインしてください"
      redirect_to root_path
    end
  end
end
