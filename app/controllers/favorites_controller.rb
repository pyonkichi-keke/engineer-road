class FavoritesController < ApplicationController
  before_action :move_to_index 
  
  def create
    @favorite = Favorite.create(user_id: current_user.id, message_id: params[:message_id])
    redirect_to  group_message_path(params[:group_id],params[:message_id])
  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, message_id: params[:message_id]) 
    @favorite.destroy
    redirect_to  group_message_path(params[:group_id],params[:message_id])
  end

 

  private
  def move_to_index
    unless user_signed_in?
      flash[:alert] = "ログインしてください"
      redirect_to root_path
    end
  end

end
