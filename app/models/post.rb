class Post < ApplicationRecord
  belongs_to :user
  belongs_to :game
  belongs_to :grade
  with_options presence: true do
    validates :user
    validates :title
    validates :content
    validates :youtube_url
  end
end
