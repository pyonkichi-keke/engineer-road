class FavoritesController < ApplicationController
  before_action :move_to_index 
  
  def create
    @favorite = Favorite.create(user_id: current_user.id, message_id: params[:message_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, message_id: params[:message_id]) 
    @favorite.destroy
    redirect_back(fallback_location: root_path)
  end

 

  private
  def move_to_index
    unless user_signed_in?
      flash[:alert] = "ログインしてください"
      redirect_to root_path
    end
  end

end
