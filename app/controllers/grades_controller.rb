class GradesController < ApplicationController
  before_action :set_game
  def show
    @game = Game.find(params[:game_id])
    @grade = Grade.find(params[:id])
    @posts = if !@grade.nil?
               Post.where(game_id: @game.id, grade_id: @grade.id).page(params[:page]).per(6)
             else
               Post.all.page(params[:page]).per(6)
             end
  end
end
