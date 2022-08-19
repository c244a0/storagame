class Grade < ApplicationRecord
  has_many :posts
  has_many :game_player
  has_many :users, through: :game_players
  has_many :game, through: :game_players
end
