class Task < ApplicationRecord
  validates :task_name, presence: true, uniqueness: true, length:{ maximum:100}
  validates :task_details, presence: true, uniqueness: true, length:{ maximum:100}
  validates :end_period, presence: true, uniqueness: true, length:{ maximum:100}
  validates :task_status, presence: true, uniqueness: true, length:{ maximum:100}
  validates :priority, presence: true, uniqueness: true, length:{ maximum:100}
  validates :author, presence: true, uniqueness: true, length:{ maximum:100}
end