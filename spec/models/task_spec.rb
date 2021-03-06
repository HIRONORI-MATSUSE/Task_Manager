require 'rails_helper'


RSpec.describe Task, type: :model do
  # before do
  #   @task = FactoryBot.create(:task)
  # end

  it "task_nameが空ならバリデーションが通らない" do
    task = Task.new(task_name: '')
    expect(task).not_to be_valid
  end

  it "task_detailsが空ならバリデーションが通らない" do
    # ここに内容を記載する
    task = Task.new(task_details: '')
    expect(task).not_to be_valid
  end

  it "end_periodが空ならバリデーションが通らない" do
    # ここに内容を記載する
    task = Task.new(end_period: '')
    expect(task).not_to be_valid
  end

  it "task_statusが空ならバリデーションが通らない" do
    # ここに内容を記載する
    task = Task.new(task_status: '')
    expect(task).not_to be_valid
  end

  it "priorityが空ならバリデーションが通らない" do
    # ここに内容を記載する
    task = Task.new(priority: '')
    expect(task).not_to be_valid
  end

  it "labelが空ならバリデーションが通らない" do
    # ここに内容を記載する
    task = Task.new(label_ids: '')
    expect(task).not_to be_valid
  end

  it "内容がすべて記載されていればバリデーションが通る" do
    # ここに内容を記載する
    user = FactoryBot.create(:first_user)
    task = Task.create( task_name: "test_task_03", task_details: "hello_end_world", end_period: "2019-10-31", task_status: "complete", priority: "high",user_id: "1")
    task = task.labels.build(name:"school")  
    expect(task.errors).to_not include("を入力してください")


  end
  #ここ
#振る舞いごとに処理が実行される
  #describeは対象(〜について) を分類
  #contextはその状態(〜な場合) を分類
#1:宣言する
  context "modelに記載したscopeによる絞りこみを確かめる" do

    #before do のデフォルトはeachになっている。before(:all) doとする事で、繰り返しをせずに、一回で読み込む。
    before(:all) do
      FactoryBot.create(:first_user)
      FactoryBot.create(:first_label)
      @task = FactoryBot.create(:task)
      # FactoryBot.create(:label)
      # @task = @task.update(label_ids: ["0"])
      # @task = @task.label_ids(label_ids: 0 )
      # @label = FactoryBot.create(:first_label)
    end


    # user = FactoryBot.create(:first_user)
    # @task = Task.new( task_name: "test_task_03", task_details: "hello_end_world", end_period: "2019-10-31", task_status: "complete", priority: "high", author: "alice",user_id: "1")
#検索フォームで作る.(factorybotで作ったtask_nameを入れる)
#factorybotの（：task）の名前を変数@taskにいれる（代入）。
    # 検索文字列に一致するメモを返すこと
    it "scope(task_name_search)による絞りこみを確かめる" do
      #Taskモデルのtask_nameを検索したとき@taskが見つかる
      #期待する(Taskモデルに記載したscorp(task_name_search)をつかって、test_task_01)が@taskの中に入っている。
      expect(Task.task_name_search("test_task_01")).to include(@task)
    end

    
      # user = FactoryBot.create(:first_user)
      # FactoryBot.create(:label)
      # FactoryBot.create(:second_label)
      # @task = FactoryBot.create(:second_task)
    it "scope(task_status)による絞りこみを確かめる" do
      #Taskモデルのtask_nameを検索したとき@taskが見つかる
      expect(Task.task_status("not_started")).to include(@task)
    end
    it "scope(label_name_search)による絞りこみを確かめる" do
       #Taskモデルのtask_nameを検索したとき@taskが見つかる
       expect(Task.label_name_search("school")).to include(@task)
    end
  end
end
