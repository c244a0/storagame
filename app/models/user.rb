class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true

  has_many :game_player
  has_many :game, through: :game_players, dependent: :destroy
  has_many :grades, through: :game_players, dependent: :destroy
  has_many :posts, dependent: :destroy
end
