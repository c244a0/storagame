require 'rails_helper'

RSpec.describe 'Comments', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @user1 = FactoryBot.create(:user)
    @game = Game.create(game_title: 'マリオカート')
    @grade = Grade.create(grades: '初級')
    @post = Post.create(title: 'test', youtube_url: 'IsXVebXtzwY', content: 'test', game_id: @game.id,
                        grade_id: @grade.id, user_id: @user.id)
  end

  it 'コメントを投稿削除ができる、別アカウントで削除を行うことができない' do
    # ログイン関係
    basic_pass root_path
    sign_in(@user)
    # 投稿画面移動
    visit post_path(@post.id)
    # コメント投稿
    fill_in 'comment[text]', with: 'test'
    click_on('投稿する')
    expect(page).to have_text('コメントを投稿しました')
    # 投稿削除
    click_on('comment-delete')
    expect(page).to have_text('コメントを削除しました')
    # 他のユーザーが削除できない確認のための再投稿
    fill_in 'comment[text]', with: 'test'
    click_on('投稿する')
    expect(page).to have_text('コメントを投稿しました')
    # ユーザー切り替えのためのログアウト
    find('#bars').click
    # 別アカウントでコメントを投稿した動画詳細画面に遷移
    click_on('ログアウト')
    sign_in(@user1)
    visit post_path(@post.id)
    expect(page).to_not have_text('削除')
  end
end
