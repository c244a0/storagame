require 'rails_helper'

RSpec.describe 'Relationships', type: :system do
  before do
    @user1 = FactoryBot.create(:user)
    @user = FactoryBot.create(:user)
    @game = Game.create(game_title: 'マリオカート')
    @grade = Grade.create(grades: '初級')
    @post = Post.create(title: 'test', youtube_url: 'IsXVebXtzwY', content: 'test', game_id: @game.id,
                        grade_id: @grade.id, user_id: @user.id)
  end

  it 'フォローを実行解除することができる' do
    basic_pass root_path
    sign_in(@user1)
    visit post_path(@post.id)
    expect(page).to have_text('フォロー')
    click_on('follow-on')
    expect(page).to have_text('フォロー解除')
    click_on('follow-off')
    expect(page).to have_text('フォロー')
  end

  it '開いているユーザーが動画投稿者と同一であるとフォロー機能が見えずフォローを実行解除できない' do
    basic_pass root_path
    sign_in(@user)
    visit post_path(@post.id)
    expect(page).to_not have_text('フォロー')
  end
end
