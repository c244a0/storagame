class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :basic_auth

  private

  def configure_permitted_parameters # deviseの処理用
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end


  ## サイドバー用
  def set_game
    @games = Game.all
    @grades = Grade.all

  def basic_auth # Basic認証
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
    end

  end
end
