class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    if @comment.save
      @comments = Comment.where(post_id: @post.id)
      flash[:notice] = 'コメントを投稿しました'
    else
      flash[:alret] = 'コメントの投稿失敗しました'
    end
    
  end

  def destroy
    @comment = Comment.find(params[:id]).destroy
    if @comment.destroy
      @comments = Comment.where(post_id: @post)
      flash[:notice] = 'コメントを削除しました'
    else
      flash[:alret] = 'コメントの削除に失敗しました'
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end
