require 'rails_helper'

RSpec.describe GamePlayer, type: :model do
  before do
    @game_player = FactoryBot.build(:game_player)
  end

  describe 'ゲーム情報登録' do
    context '登録できる場合' do
      it '条件が揃っていると登録できる' do
        expect(@game_player).to be_valid
      end
    end
    context '登録できない場合' do
      it 'user_idがないと登録できない' do
        @game_player.user = nil
        @game_player.valid?
        expect(@game_player.errors.full_messages).to include('User must exist')
      end
      it 'user_idがないと登録できない' do
        @game_player.game = nil
        @game_player.valid?
        expect(@game_player.errors.full_messages).to include('Game must exist')
      end
      it 'user_idがないと登録できない' do
        @game_player.grade = nil
        @game_player.valid?
        expect(@game_player.errors.full_messages).to include('Grade must exist')
      end
    end
  end
end
