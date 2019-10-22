require 'rails_helper'

RSpec.describe Task, type: :model do

  it "task_nameが空ならバリデーションが通らない" do
    task = Task.new(task_name: '', content: '失敗テスト')
    expect(task).not_to be_valid
  end

  it "task_detailsが空ならバリデーションが通らない" do
    # ここに内容を記載する
    task = Task.new(task_details: '', content: '失敗テスト')
    expect(task).not_to be_valid
  end

  it "end_periodが空ならバリデーションが通らない" do
    # ここに内容を記載する
    task = Task.new(end_period: '', content: '失敗テスト')
    expect(task).not_to be_valid
  end

  it "task_statusが空ならバリデーションが通らない" do
    # ここに内容を記載する
    task = Task.new(task_status: '', content: '失敗テスト')
    expect(task).not_to be_valid
  end

  it "priorityが空ならバリデーションが通らない" do
    # ここに内容を記載する
    task = Task.new(priority: '', content: '失敗テスト')
    expect(task).not_to be_valid
  end

  it "authorが空ならバリデーションが通らない" do
    # ここに内容を記載する
    task = Task.new(author: '', content: '失敗テスト')
    expect(task).not_to be_valid
  end

  it "titleとcontentに内容が記載されていればバリデーションが通る" do
    # ここに内容を記載する
  end
end