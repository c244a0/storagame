class Relationship < ApplicationRecord
  # フォローする側
  belongs_to :following, class_name: 'User'
  # フォローされる側
  belongs_to :follower, class_name: 'User'
  validates :following_id, uniqueness: { scope: :follower_id }
end
