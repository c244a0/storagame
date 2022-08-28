class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  def index
    @posts = Post.includes(:game, :grade, :user)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    # youtubeの動画識別に利用されている 11桁の文字列を取得するための正規表現
    url = params[:post][:youtube_url]
    url = if @post.youtube_url[0..16] == 'https://youtu.be/'
            url[17..27]
          elsif @post.youtube_url[43] == '&'
            url[32..42]
          else
            url.last(11)
          end
    @post.youtube_url = url
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show # 動画視聴画面
    @post = Post.find(params[:id])
    @user = @post.user
    @comments = Comment.where(post_id: @post)
    @comment = @post.comments.build
  end

  def edit
  end

  def update
    @post.update(post_params)
    if @post.save
      redirect_to post_path(@post.id)
      flash[:notice] = '更新しました'
    else
      render :edit
    end
  end

  def destroy
    if @post.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :youtube_url).merge(user_id: current_user.id, game_id: params[:post][:game],
                                                                       grade_id: params[:post][:grade])
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
