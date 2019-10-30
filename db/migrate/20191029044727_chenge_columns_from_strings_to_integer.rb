class ChengeColumnsFromStringsToInteger < ActiveRecord::Migration[5.2]
  def change
    change_column :tasks, :task_status, 'integer USING CAST(task_status AS integer)'
    change_column :tasks, :priority, 'integer USING CAST(priority AS integer)'
  end
end
