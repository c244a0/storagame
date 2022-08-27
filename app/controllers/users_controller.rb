class UsersController < ApplicationController
  before_action :authenticate_user!

  def index # ユーザー本人のマイ動画画面
    @user = User.find(current_user.id)
    @posts = Post.where(user_id: current_user.id)
  end

  def show # ユーザー本人以外のマイ動画画面
    @user = User.find(params[:id])
    @posts = Post.where(params[:id])
  end
end
