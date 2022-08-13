class GamePlayer < ApplicationRecord
  belongs_to :user
  belongs_to :game
  belongs_to :grade
  with_options presence: true do
    validates :user_id
    validates :game_id
    validates :grade_id
  end
end
