require 'rails_helper'

RSpec.describe 'Games', type: :system do
  before do
    # ゲーム名のデータ
    @game = Game.create(game_title: 'マリオカート')
    # 階級のデータ
    @grade = Grade.create(grades: '初級')
    @user = FactoryBot.create(:user)
  end

  it 'ゲーム情報を登録することができる' do
    basic_pass root_path
    sign_in(@user)
    visit new_game_path
    select @grade.grades, from: "game_player_grade_id-#{@game.id}"
    expect(page).to have_text('マリオカート')
    expect(page).to have_text('初級')
  end
end
