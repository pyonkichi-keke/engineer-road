class GroupsController < ApplicationController
  before_action :move_to_index, except: :index

  def index
    @groups = Group.all
  end

  def create
    Group.create(group_params)
    redirect_to root_path
    flash[:notice]= "グループを作成しました!"
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to root_path
    flash[:notice]= "グループを削除しました!"
  end

  private

  def group_params
    params.permit(:name)
  end

  def move_to_index
    unless user_signed_in?
      flash[:alert] = "ログインしてください"
      redirect_to root_path
    end
  end
end
