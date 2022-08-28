require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @post = FactoryBot.create(:post)
    @user = FactoryBot.create(:user)
    @comment = FactoryBot.build(:comment, user_id: @user.id, post_id: @post.id)
  end

  describe 'コメント投稿機能' do
    context 'コメント投稿できる' do
      it '条件が揃っていれば投稿できる' do
        expect(@comment).to be_valid
      end
    end

    context 'コメント投稿できない場合' do
      it 'post_idがないと投稿できない' do
        @comment.post_id = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('Post must exist')
      end
      it 'user_idがないと投稿できない' do
        @comment.user_id = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('User must exist')
      end
      it 'textがないと投稿できない' do
        @comment.text = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Text can't be blank")
      end
      it 'textが300文字以上だと投稿できない' do
        @comment.text = Faker::Internet.password(min_length: 301)
        @comment.valid?
        expect(@comment.errors.full_messages).to include('Text is too long (maximum is 300 characters)')
      end
    end
  end
end
