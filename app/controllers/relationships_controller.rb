class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  def create
    @user = User.find(params[:user_id])
    following = current_user.relationships.build(follower_id: params[:user_id])
    following.save
    flash[:notice] = 'フォローしました'
  end

  def destroy
    @user = User.find(params[:user_id])
    following = current_user.relationships.find_by(params[:follower_id])
    following.destroy
    flash[:notice] = 'フォローを解除しました'
  end
  
  def followings
    user = User.find(params[:id])
    @user = user.followings
  end

  def followers
    user = User.find(params[:id])
    @user = user.followers
  end
end
