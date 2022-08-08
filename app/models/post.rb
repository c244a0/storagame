class Post < ApplicationRecord
  belongs_to :user
  belongs_to :game
  belongs_to :grade
  with_options presence: true do
    validates :user
    validates :title, length: { minimum: 1, maximum: 50 }
    validates :content, length: { minimum: 1, maximum: 2000 }
    validates :youtube_url
    validates :game
    validates :grade
  end
end
