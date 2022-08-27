class GamePlayer < ApplicationRecord
  belongs_to :user
  belongs_to :game
  belongs_to :grade
  validates :user_id, uniqueness: { scope: [:game_id] } # 同じユーザーに同じゲーム名の階級を複数登録するのを防ぐため。
end
