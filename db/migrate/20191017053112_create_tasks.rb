class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :task_name
      t.string :task_details
      t.date :end_period
      t.integer :task_status
      t.integer :priority
      t.string :author

      t.timestamps
    end
  end
end
