require 'rails_helper'

RSpec.describe 'Posts', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @game = Game.create(game_title: 'マリオカート')
    @grade = Grade.create(grades: '初級')
  end
  it '動画を投稿することができる' do
    # 投稿ページへ移動する
    basic_pass root_path
    sign_in(@user)
    visit new_post_path

    # 投稿をする
    fill_in 'title', with: 'test'
    fill_in 'youtube-url', with: 'IsXVebXtzwY'
    fill_in 'content', with: 'kaisetu'
    select @game.game_title, from: 'post[game]'
    select @grade.grades, from: 'post[grade]'
    expect do
      find('input[name="commit"]').click
    end.to change { Post.all.count }.by(1)
  end

  it '動画を削除することができる' do
    @post = Post.create(title: 'test', youtube_url: 'IsXVebXtzwY', content: 'test', game_id: @game.id,
                        grade_id: @grade.id, user_id: @user.id)
    basic_pass root_path
    sign_in(@user)
    visit post_path(@post.id)
    expect do
      click_link '削除'
    end.to change { Post.all.count }.by(-1)
  end
end
