class Post < ApplicationRecord
  belongs_to :user
  belongs_to :game
  belongs_to :grade
  has_many   :comments, dependent: :destroy
  with_options presence: true do
    validates :user
    validates :title, length: { minimum: 1, maximum: 50 }
    validates :content, length: { minimum: 1, maximum: 2000 }
    validates :youtube_url
    validates :game
    validates :grade
  end

  # 検索後のデータベース引き出し処理
  def self.search(search)
    if search != ""
      Post.where('title LIKE(?)', "%#{search}%")
    else
      Post.includes(:game, :grade, :user)
    end
  end
  # 動画の投稿時間表示
  def how_long_ago
    if (Time.now - self.created_at) <= 60 * 60
      # 60分以内なら
      ((Time.now - self.created_at) / 60).to_i.to_s + "分前"
    elsif (Time.now - self.created_at) <= 60 * 60 * 24
      # 24時間以内なら
      ((Time.now - self.created_at) / 3600).to_i.to_s + "時間前"
    elsif (Date.today - self.created_at.to_date) <= 30
      # 30日以内なら
      (Date.today - self.created_at.to_date).to_i.to_s + "日前"
    else
      # それ以降
      self.created_at
    end
  end
end
