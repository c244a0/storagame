class GradesController < ApplicationController
  before_action :set_game
  def show
    @game = Game.find(params[:game_id])
    @grade = Grade.find(params[:id])
    if @grade != nil
      @posts = Post.where(game_id: @game.id, grade_id: @grade.id).page(params[:page]).per(6)
    else
      @posts = Post.all.page(params[:page]).per(6)
    end
  end
end
