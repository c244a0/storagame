class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :set_game, only: [:index, :show]
  before_action :proto_recommend, only: :index
  before_action :user_check, only: [:edit, :destroy]

  def index
    @posts = Post.includes(:game, :grade, :user).limit(6).order(created_at: :DESC)
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

  def proto_recommend
    unless current_user.nil?
      @game_player = GamePlayer.where(user_id: current_user.id)
      @post_data = []
      i = 0
      ## ユーザーの登録しているゲーム名と階級と同じidを持つ動画を取り出す
      @game_player.length.times do
        @post = Post.where(game_id: @game_player[i].game.id, grade_id: @game_player[i].grade.id).limit(3).order(created_at: :DESC)
        @post_data << @post
        i += 1
      end
    end
  end

  def user_check
    if current_user.id != @post.user.id
      flash[:alert] = '不正なアクセスです'
      redirect_to root_path
    end
  end
end
