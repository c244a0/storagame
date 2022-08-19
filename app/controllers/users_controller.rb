class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(current_user.id)
    @posts = Post.where(user_id: current_user.id)
  end

  def show
    @user = User.find(params[:id])
    @posts = Post.where(params[:id])
  end
end
