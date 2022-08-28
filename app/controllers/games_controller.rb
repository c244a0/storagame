class GamesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_game

  def index 
    @posts = Post.includes(:game, :grade, :user).page(params[:page]).per(6)
  end
  
  def show
    @game = Game.find(params[:id])
    @posts = Post.where(game_id: @game.id).page(params[:page]).per(6)
  end

  def new
    @game_players = GamePlayer.new
    @games = Game.all
  end

  def create
    @game_players = GamePlayer.new(game_player_params)
    @already_game_players = GamePlayer.where(user_id: current_user.id, game_id: params[:game_player][:game_id])
    if @game_players.grade_id.blank?
      redirect_to new_game_path
      flash[:alert] = '階級が記入されていません'
    elsif @already_game_players.present?
      @already_game_players.update(game_player_params)
      redirect_to new_game_path
      flash[:notice] = '更新しました'
    elsif @game_players.save
      redirect_to new_game_path
      flash[:notice] = '登録しました'
    else
      render :new
      flash[:alert] = '登録に失敗しました'
    end
  end

  private

  def game_player_params
    params.require(:game_player).permit(:user_id, :game_id, :grade_id).merge(user_id: current_user.id,
                                                                             game_id: params[:game_player][:game_id], grade_id: params[:game_player][:grade_id])
  end

end
