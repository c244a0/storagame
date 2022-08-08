class Game < ApplicationRecord
  has_many :users, through: :users
  has_many :grades, through: :users
  has_many :posts
end
