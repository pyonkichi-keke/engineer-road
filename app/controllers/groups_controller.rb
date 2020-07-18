class GroupsController < ApplicationController
  before_action :move_to_index, except: :index

  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    Group.create(group_params)
    redirect_to root_path
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end

  def move_to_index
    unless user_signed_in?
      flash[:alert] = "ログインしてください"
      redirect_to root_path
    end
  end
end
