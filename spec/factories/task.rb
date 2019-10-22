# 「FactoryBotを使用します」という記述
FactoryBot.define do

  # 作成するテストデータの名前を「task」とします
  # （実際に存在するクラス名と一致するテストデータの名前をつければ、そのクラスのテストデータを自動で作成します）
  factory :task do
    task_name { 'test_task_01' }
    task_details { 'testtesttest' } 
    end_period { 'testtesttest' }
    task_status { 'testtesttest' }
    priority { 'testtesttest' }
    author { 'testtesttest' }
  end

  # 作成するテストデータの名前を「second_task」とします
  # （存在しないクラス名の名前をつける場合、オプションで「このクラスのテストデータにしてください」と指定します）
  factory :second_task, class: Task do
    task_name { 'test_task_02' }
    task_details { 'samplesample' }
    end_period { 'samplesample' }
    task_status { 'samplesample' }
    priority { 'samplesample' }
    author { 'samplesample' }
  end

  factory :third_task, class: Task do
    task_name { 'test_task_03' }
    task_details { 'aaaaaaaaaaaa' }
    end_period { 'aaaaaaaaaaaa' }
    task_status { 'aaaaaaaaaaaa' }
    priority { 'aaaaaaaaaaaa' }
    author { 'aaaaaaaaaaaa' }
  end
end