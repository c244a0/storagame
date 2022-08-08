require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end
  describe '動画投稿' do
    context '投稿できる場合' do
      it 'すべての条件が合致していれば投稿できる' do
        expect(@post).to be_valid
      end
    end
    context '投稿できない場合' do
      it 'titleがないと投稿できない' do
        @post.title = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Title can't be blank")
      end
      it 'titleが50文字を超えていると投稿できない' do
        @post.title = Faker::Internet.password(min_length: 52)
        @post.valid?
        expect(@post.errors.full_messages).to include('Title is too long (maximum is 50 characters)')
      end
      it 'youtube_urlがないと投稿できない' do
        @post.youtube_url = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Youtube url can't be blank")
      end
      it 'contentがないと投稿できない' do
        @post.content = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Content can't be blank")
      end
      it 'contentが2000文字を超えていると投稿できない' do
        @post.content = Faker::Internet.password(min_length: 2001)
        @post.valid?
        expect(@post.errors.full_messages).to include('Content is too long (maximum is 2000 characters)')
      end
      it 'user_idがないと投稿できない' do
        @post.user = nil
        @post.valid?
        expect(@post.errors.full_messages).to include('User must exist')
      end
      it 'game_idがないと投稿できない' do
        @post.game = nil
        @post.valid?
        expect(@post.errors.full_messages).to include('Game must exist')
      end
      it 'grade_idがないと投稿できない' do
        @post.grade = nil
        @post.valid?
        expect(@post.errors.full_messages).to include('Grade must exist')
      end
    end
  end
end
