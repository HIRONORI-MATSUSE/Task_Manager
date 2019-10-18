# このrequireで、Capybaraなどの、Feature Specに必要な機能を使用可能な状態にしています
require 'rails_helper'

# このRSpec.featureの右側に、「タスク管理機能」のように、テスト項目の名称を書きます（do ~ endでグループ化されています）
RSpec.feature "タスク管理機能", type: :feature do
  # scenario（itのalias）の中に、確認したい各項目のテストの処理を書きます。
  scenario "タスク一覧のテスト" do
    Task.create!(task_name: 'test_task_01', task_details: 'testtesttest')
    Task.create!(task_name: 'test_task_02', task_details: 'samplesample')

    visit tasks_path
    expect(page).to have_content 'testtesttest' 
    expect(page).to have_content 'samplesample'
  end

  scenario "タスク作成のテスト" do
    visit new_task_path
    #新規画面へ飛ぶ
    #「タスク名」というラベル名の入力欄と、「タスク詳細」というラベル名の入力欄に
    # タスクのタイトルと内容をそれぞれfill_in（入力）する
    #2.ここに「タスク名」というラベル名の入力欄に内容をfill_in（入力）する処理を書く
    #fillはidを見ている
    fill_in 'task_task_name', with: 'test_task_01'
    # 「登録する」というvalue（表記文字）のあるボタンをclick_onする（クリックする）
    # 4.「登録する」というvalue（表記文字）のあるボタンをclick_onする（クリックする）する処理を書く
    click_on 'Create Task'
    # clickで登録されたはずの情報が、タスク詳細ページに表示されているかを確認する
    # （タスクが登録されたらタスク詳細画面に遷移されるという前提）
    # 5.タスク詳細ページに、テストコードで作成したはずのデータ（記述）がhave_contentされているか（含まれているか）を確認（期待）するコードを書く
    expect(page).to have_content '作成しました'
  end

  scenario "タスク詳細のテスト" do
    #直接詳細から見る場合

    
    # task = Task.create!(task_name: 'test_task_01', task_details: 'testtesttest')
    # visit task_path(task.id)
    # # 3.ここに「タスク詳細」というラベル名の入力欄に内容をfill_in（入力）する処理を書く
    # expect(page).to have_content 'testtesttest'
    


    #一覽から見る場合


    Task.create!(task_name: 'test_task_01', task_details: 'testtesttest')
    # Task.create!(task_name: 'test_task_02', task_details: 'samplesample')
    # Task.create!(task_name: 'test_task_03', task_details: 'aaaaaaaaaaaa')

    visit tasks_path
    #  save_and_open_page
    click_on '詳細'
   

    expect(page).to have_content 'testtesttest'


  end
end