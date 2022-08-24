class GradesController < ApplicationController
  before_action :set_game
  def show
    @game = Game.find(params[:game_id])
    @grade = Grade.find(params[:id])
    @posts = Post.where(game_id: @game.id, grade_id: @grade.id)
  end
end
