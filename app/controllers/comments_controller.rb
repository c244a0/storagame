class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    if @comment.save
      @comments = Comment.where(post_id: @post.id)
      flash.now[:notice] = 'コメントを投稿しました'
    else
      flash.now[:alret] = 'コメントの投稿失敗しました'
    end
  end

  def destroy
    if @comment.destroy
      @comments = Comment.where(post_id: @post)
      flash.now[:notice] = 'コメントを削除しました'
    else
      flash.now[:alret] = 'コメントの削除に失敗しました'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end
