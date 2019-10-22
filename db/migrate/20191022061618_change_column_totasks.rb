class ChangeColumnTotasks < ActiveRecord::Migration[5.2]

  def up
    change_column :tasks, :task_name,:string, null: false
    change_column :tasks, :task_details,:string, null: false
    change_column :tasks, :end_period,:string, null: false
    change_column :tasks, :task_status,:string, null: false
    change_column :tasks, :priority,:string, null: false
    change_column :tasks, :author,:string, null: false
  end

  def down
    change_column :tasks, :task_name,:string, null: true
    change_column :tasks, :task_details,:string, null: true
    change_column :tasks, :end_period,:string, null: true
    change_column :tasks, :task_status,:string, null: true
    change_column :tasks, :priority,:string, null: true
    change_column :tasks, :author,:string
  end

end
