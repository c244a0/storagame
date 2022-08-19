class Game < ApplicationRecord
  has_many :game_player
  has_many :users, through: :game_players
  has_many :grades, through: :game_players
  has_many :posts
end
