require 'rails_helper'

# このRSpec.featureの右側に、「タスク管理機能」のように、テスト項目の名称を書きます（do ~ endでグループ化されています）
RSpec.feature "ユーザー管理機能", type: :feature do

  background do
    @user = FactoryBot.create(:first_user)
    @second_user = FactoryBot.create(:second_user)
    @third_user = FactoryBot.create(:third_user)
  end

  # scenario（itのalias）の中に、確認したい各項目のテストの処理を書きます。
  scenario "ユーザー作成した後、マイページに飛ぶかのテスト" do
    visit user_path(@user.id)
    expect(page).to have_content 'test'
  end

  scenario "ログイン、ログアウトできるか確認するテスト" do
    visit new_session_path
    fill_in 'Email', with: 'jon@gmail.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'
    expect(page).to have_content 'jon'
    click_on 'ログアウト'
    expect(page).to have_content 'ログイン'
  end

  scenario "ログイン中ユーザー作成ページにいけないようにするテスト" do
    visit new_session_path
    fill_in 'Email', with: 'jon@gmail.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'
    visit new_user_path
    expect(page).to have_content 'jon'
  end

  scenario "自分以外のマイページに行けないようにする" do
    visit new_session_path
    fill_in 'Email', with: 'jon@gmail.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'
    visit user_path(@second_user)
    expect(page).to have_content 'jon'
  end

  scenario "管理者がログインして一覧からユーザー作成ページにいけるかのテスト" do

    visit new_session_path
    fill_in 'Email', with: 'alice@gmail.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'
    click_on '新規登録'
  end

  scenario "管理者がログインして一覧から詳細ページにいけるかのテスト" do
    visit new_session_path
    fill_in 'Email', with: 'alice@gmail.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'
    page.first(".show_link").click
    expect(page).to have_content 'jon'
  end

  scenario "管理者がログインして一覧からユーザー情報更新できるかのテスト" do
    visit new_session_path
    fill_in 'Email', with: 'alice@gmail.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'
    page.first(".edit_link").click
    fill_in '名前', with: 'jon'
    fill_in 'メールアドレス', with: 'jon@gmail.com'
    fill_in 'パスワード', with: '123456'
    fill_in '確認用パスワード', with: '123456'
    save_and_open_page
    click_button 'Create my account'
    expect(page).to have_content 'jon'
  end

  scenario "管理者がログインして一覧から削除できるかのテスト" do
    visit new_session_path
    fill_in 'Email', with: 'alice@gmail.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'
    page.first(".destroy_link").click
    expect(page).to have_content 'alice'
  end
  # bin/rspec spec/features/user.spec.rb

end
