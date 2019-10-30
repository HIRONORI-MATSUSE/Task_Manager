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
end