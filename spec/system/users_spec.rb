require 'rails_helper'

RSpec.describe 'ユーザーログイン機能', type: :system do
  it 'サインアップする' do
    basic_pass root_path
    visit new_user_registration_path
    expect(current_path).to eq(new_user_registration_path)

    fill_in 'user_nickname', with: 'tron'
    fill_in 'user_email', with: 'a@a'
    fill_in 'user_password', with: 'aaaaaa1'
    fill_in 'user_password_confirmation', with: 'aaaaaa1'
    click_on('サインアップ')
    expect(current_path).to eq(root_path)
  end

  it 'ログインに成功し、トップページに遷移する' do
    # 予め、ユーザーをDBに保存する
    @user = FactoryBot.create(:user)

    # ログインページへ移動する
    # ログイン機能は他のフォルダで、support/sign_in_supportでまとめています。
    basic_pass root_path
    visit new_user_session_path

    # ログインしていない場合、サインインページに遷移していることを確認する
    expect(current_path).to eq(new_user_session_path)

    # すでに保存されているユーザーのemailとpasswordを入力する
    fill_in 'user_email', with: @user.email
    fill_in 'user_password', with: @user.password

    # ログインボタンをクリックする
    click_on('LOG IN')

    # トップページに遷移していることを確認する
    expect(current_path).to eq(root_path)
  end

  it 'ログインが失敗した場合は、ログインページに留まる' do
    # ログインページに移動する
    visit root_path
    visit new_user_session_path
    expect(current_path).to eq(new_user_session_path)

    # 保存されていないユーザーのemailとpasswordを入力する
    fill_in 'user_email', with: 'a@qwedwuh'
    fill_in 'user_password', with: '1t2317538'

    # ログインボタンをクリックする
    click_on('LOG IN')

    # ログインページに留まっていることを確認する
    expect(current_path).to eq(new_user_session_path)
  end
end
