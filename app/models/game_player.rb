class GamePlayer < ApplicationRecord
  belongs_to :user
  belongs_to :game
  belongs_to :grade
  validates :grade_id, presence: true
end
