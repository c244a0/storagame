class GradesController < ApplicationController
  before_action :set_game
  def show # サイドバーでゲーム名下の階級がクリックされた場合の処理、または一覧画面のもっと見るが押された場合
    @game = Game.find(params[:game_id])
    @grade = Grade.find(params[:id])
    if @grade != nil
      @posts = Post.where(game_id: @game.id, grade_id: @grade.id).page(params[:page]).per(6).order(created_at: :DESC)
    else
      @posts = Post.all.page(params[:page]).per(6).order(created_at: :DESC)
    end
  end
end
