require 'rails_helper'

RSpec.describe Task, type: :model do

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

  it "authorが空ならバリデーションが通らない" do
    # ここに内容を記載する
    task = Task.new(author: '')
    expect(task).not_to be_valid
  end

  it "内容がすべて記載されていればバリデーションが通る" do
    # ここに内容を記載する
    task = Task.new( task_name: "test_task_03", task_details: "hello_end_world", end_period: "2019-10-31", task_status: "complete", priority: "high", author: "alice")
      expect(task).to be_valid
  end

  #ここ
#振る舞いごとに処理が実行される
  #describeは対象(〜について) を分類
  #contextはその状態(〜な場合) を分類
#1:宣言する
  context "modelに記載したscopeによる絞りこみを確かめる" do
#検索フォームで作る.(factorybotで作ったtask_nameを入れる)
#factorybotの（：task）の名前を変数@taskにいれる（代入）。
  before do
    @task = FactoryBot.create(:task)
  end
    # 検索文字列に一致するメモを返すこと
    it "modelに記載したscopeによる絞りこみを確かめる" do
      #Taskモデルのtask_nameを検索したとき@taskが見つかる
      #期待する(Taskモデルに記載したscorp(task_name_search)をつかって、test_task_01)が@taskの中に入っている。
      expect(Task.task_name_search("test_task_01")).to include(@task)
    end
    it "www" do
      #Taskモデルのtask_nameを検索したとき@taskが見つかる
      expect(Task.task_status("not_started")).to include(@task)
    end
  end
end