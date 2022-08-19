class GamePlayer < ApplicationRecord
  belongs_to :user
  belongs_to :game
  belongs_to :grade, optional: false
  validates :user_id, uniqueness: { scope: [:game_id] }
end
