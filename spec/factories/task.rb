# 「FactoryBotを使用します」という記述
FactoryBot.define do

  # 作成するテストデータの名前を「task」とします
  # （実際に存在するクラス名と一致するテストデータの名前をつければ、そのクラスのテストデータを自動で作成します）
  factory :task do
    task_name { 'test_task_01' }
    task_details { 'hello_world' } 
    end_period { '2019-10-29' }
    task_status { 'not_started' }
    priority { 'low' }
    author { 'jon' }
  end

  # 作成するテストデータの名前を「second_task」とします
  # （存在しないクラス名の名前をつける場合、オプションで「このクラスのテストデータにしてください」と指定します）
  factory :second_task, class: Task do
    task_name { 'test_task_02' }
    task_details { 'hello_hello' }
    end_period { '2019-10-30' }
    task_status { 'started_in' }
    priority { 'medium' }
    author { 'sum' }
  end

  factory :third_task, class: Task do
    task_name { 'test_task_03' }
    task_details { 'hello_end_world' }
    end_period { '2019-10-31' }
    task_status { 'complete' }
    priority { 'high' }
    author { 'alice' }
  end
end