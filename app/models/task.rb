class Task < ApplicationRecord
  validates :task_name, presence: true, uniqueness: true, length:{ maximum:100}
  validates :task_details, presence: true, uniqueness: true, length:{ maximum:100}
  validates :end_period, presence: true
  validates :task_status, presence: true
  validates :priority, presence: true
  validates :author, presence: true
end