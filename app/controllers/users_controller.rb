class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_game

  # ユーザー本人のマイ動画画面
  def index
    @user = User.find(current_user.id)
    @posts = Post.where(user_id: current_user.id).page(params[:page]).per(6)
  end

  # ユーザー本人以外のマイ動画画面
  def show
    @user = User.find(params[:id])
    @posts = Post.where(user_id: @user).page(params[:page]).per(3)
  end
end
