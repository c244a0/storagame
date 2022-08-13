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
        @game_player.user_id = nil
        @game_player.valid?
        binding.pry
      end
    end
  end
end
