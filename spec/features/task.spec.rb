# このrequireで、Capybaraなどの、Feature Specに必要な機能を使用可能な状態にしています
require 'rails_helper'

# このRSpec.featureの右側に、「タスク管理機能」のように、テスト項目の名称を書きます（do ~ endでグループ化されています）
RSpec.feature "タスク管理機能", type: :feature do

  background do
    FactoryBot.create(:first_user)
    FactoryBot.create(:second_user)
    FactoryBot.create(:third_user)
    FactoryBot.create(:task)
    FactoryBot.create(:second_task)
    FactoryBot.create(:third_task)
  end

  # scenario（itのalias）の中に、確認したい各項目のテストの処理を書きます。
  scenario "タスク一覧のテスト" do
    visit new_session_path
    fill_in 'Email', with: 'jon@gmail.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'

    visit tasks_path
    expect(page).to have_content 'hello_world'
    expect(page).to have_content 'hello_hello'
  end

  scenario "タスクとラベル作成のテスト" do
    visit new_session_path
    fill_in 'Email', with: 'jon@gmail.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'


    #ラベルを作成する
    visit new_label_path
    fill_in 'label_name', with: 'school'
    click_on '登録する'

    visit new_task_path
    #新規画面へ飛ぶ
    #「タスク名」というラベル名の入力欄と、「タスク詳細」というラベル名の入力欄に
    # タスクのタイトルと内容をそれぞれfill_in（入力）する
    #2.ここに「タスク名」というラベル名の入力欄に内容をfill_in（入力）する処理を書く
    #fillはidを見ている
    fill_in 'task_task_name', with: 'test_task_01'
    fill_in 'task_task_details', with: 'hello_world'
    fill_in 'task_end_period', with: '2019-10-29'
    # select 'not_started', from: 'task_status'
    find("option[value='not_started']").select_option
    # select 'low', from: 'priority'
    find("option[value='low']").select_option
    check 'task_label_ids_1'
    # 「登録する」というvalue（表記文字）のあるボタンをclick_onする（クリックする）
    # 4.「登録する」というvalue（表記文字）のあるボタンをclick_onする（クリックする）する処理を書く
    
    
    click_on '登録する'
    # clickで登録されたはずの情報が、タスク詳細ページに表示されているかを確認する
    # （タスクが登録されたらタスク詳細画面に遷移されるという前提）
    # 5.タスク詳細ページに、テストコードで作成したはずのデータ（記述）がhave_contentされているか（含まれているか）を確認（期待）するコードを書く
    expect(page).to have_content '作成しました'
  end

  scenario "タスク詳細のテスト" do
    visit new_session_path
    fill_in 'Email', with: 'jon@gmail.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'
    #直接詳細から見る場合
    # task = Task.create!(task_name: 'test_task_01', task_details: 'testtesttest')
    # visit task_path(task.id)
    # # 3.ここに「タスク詳細」というラベル名の入力欄に内容をfill_in（入力）する処理を書く
    # expect(page).to have_content 'testtesttest'
    #一覽から見る場合
    # Task.create!(task_name: 'test_task_02', task_details: 'samplesample')
    # Task.create!(task_name: 'test_task_03', task_details: 'aaaaaaaaaaaa')
    visit tasks_path
    #save_and_open_page
    # save_and_open_page
    expect(page).to have_link '詳細'
    # puts  "松瀬#{expect(page)}"
    # expect(page).to have_content task.all

  end

  scenario "タスクが作成日時の降順に並んでいるかのテスト" do
    visit new_session_path
    fill_in 'Email', with: 'jon@gmail.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'
    # ここにテスト内容を記載する
    visit tasks_path

    # fill_in 'task_task_name', with: 'test_task_01'
    # click_on '登録する'
    tds = page.all('tr td')

    expect(tds[0]).to have_content 'test_task_03'
    # all('table tr')[1]. have_content 'test_task_03'
    #toは〜であること。eqは期待値と実際の値が等しいこと。beは等号、不等号を使用して値の大小を検証する時に使う。
  end

  scenario "終了期限順に並んでいるかのテスト" do
    visit new_session_path
    fill_in 'Email', with: 'jon@gmail.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'
    # ここにテスト内容を記載する
    visit tasks_path
    # fill_in 'task_task_name', with: 'test_task_01'
    click_on '終了期限順'
    eps = page.all('tr td')

    expect(eps[0]).to have_content 'test_task_03'
    # all('table tr')[1]. have_content 'test_task_03'
    #toは〜であること。eqは期待値と実際の値が等しいこと。beは等号、不等号を使用して値の大小を検証する時に使う。
  end

  scenario "優先順位順に並んでいるかのテスト" do
    visit new_session_path
    fill_in 'Email', with: 'jon@gmail.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'
    # ここにテスト内容を記載する
    visit tasks_path

    click_on '優先順位順'

    # fill_in 'task_task_name', with: 'test_task_01'
    # click_on '登録する'
    ps = page.all('tr td')

    expect(ps[0]).to have_content 'test_task_03'
    # all('table tr')[1]. have_content 'test_task_03'
    #toは〜であること。eqは期待値と実際の値が等しいこと。beは等号、不等号を使用して値の大小を検証する時に使う。
  end
  scenario "searchで検索すると検索したものが並ぶかのテスト" do
    visit new_session_path
    fill_in 'Email', with: 'jon@gmail.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'
    # ここにテスト内容を記載する
    visit tasks_path

    fill_in 'task_name_search', with: 'test_task_03'
    click_on '検索する'

    # fill_in 'task_task_name', with: 'test_task_01'
    # click_on '登録する'
    ps = page.all('tr td')

    expect(ps[0]).to have_content 'test_task_03'
    # all('table tr')[1]. have_content 'test_task_03'
    #toは〜であること。eqは期待値と実際の値が等しいこと。beは等号、不等号を使用して値の大小を検証する時に使う。
  end

  scenario "statusのプルダウンメニューを選択したものが並ぶかのテスト" do
    # ここにテスト内容を記載する
    visit new_session_path
    fill_in 'Email', with: 'jon@gmail.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'
    visit tasks_path

    find("option[value='complete']").select_option
    click_on '検索する'

    # fill_in 'task_task_name', with: 'test_task_01'
    # click_on '登録する'
    ps = page.all('tr td')

    expect(ps[0]).to have_content 'test_task_03'
    # all('table tr')[1]. have_content 'test_task_03'
    #toは〜であること。eqは期待値と実際の値が等しいこと。beは等号、不等号を使用して値の大小を検証する時に使う。
    # bin/rspec spec/features/task.spec.rb
  end

  scenario "ラベル名で検索すると検索したものが並ぶかのテスト" do
    visit new_session_path
    fill_in 'Email', with: 'jon@gmail.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'
    # ここにテスト内容を記載する

    #ラベルを作成する
    visit new_label_path
    fill_in 'label_name', with: 'home'
    
    click_on '登録する'

    visit new_task_path
    fill_in 'task_task_name', with: 'test_task_01'
    fill_in 'task_task_details', with: 'hello_world'
    fill_in 'task_end_period', with: '2019-10-29'
    find("option[value='not_started']").select_option
    find("option[value='low']").select_option
    check 'task_label_ids_2'
    
    click_on '登録する'


    visit tasks_path
    fill_in 'task_label_search', with: 'home'
    click_on '検索する'

    # fill_in 'task_task_name', with: 'test_task_01'
    # click_on '登録する'
    ps = page.all('tr td')

    expect(ps[2]).to have_content 'home'
    # all('table tr')[1]. have_content 'test_task_03'
    #toは〜であること。eqは期待値と実際の値が等しいこと。beは等号、不等号を使用して値の大小を検証する時に使う。
  end

end
