class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @posts = Post.order('id DESC').limit(100)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    url = params[:post][:youtube_url]
    if @post.youtube_url[0..16] == "https://youtu.be/"
      url = url.last(11)
    elsif @post.youtube_url[43] == "&"
      url = url[32..42]
    else
      url = url.last(11)
    end
    @post.youtube_url = url
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :youtube_url).merge(user_id: current_user.id, game_id: params[:post][:game],
                                                                       grade_id: params[:post][:grade])
  end
end
