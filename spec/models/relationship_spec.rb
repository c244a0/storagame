require 'rails_helper'

RSpec.describe Relationship, type: :model do
  before do
    @user1 = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:user)
    @follow = FactoryBot.build(:relationship) 
  end
  describe 'フォロー機能' do
    context 'フォローできる場合' do
      it '条件を満たしていればフォローできる' do
        expect(@follow).to be_valid
      end
    end
    context 'フォローできない場合' do
      it 'follower_idがないとフォローできない' do
        @follow.follower_id = nil
        @follow.valid?
        expect(@follow.errors.full_messages).to include("Follower must exist")
      end
      it 'following_idないとフォローできない' do
        @follow.following_id = nil
        @follow.valid?
        expect(@follow.errors.full_messages).to include("Following must exist")
      end
    end
  end
end
