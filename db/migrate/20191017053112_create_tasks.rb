class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :task_name
      t.string :task_details
      t.string :end_period
      t.string :task_status
      t.string :priority
      t.string :author

      t.timestamps
    end
  end
end
