class Task < ApplicationRecord
  belongs_to :user
  validates :task_name, presence: true, length:{ maximum:100}
  validates :task_details, presence: true, length:{ maximum:100}
  validates :end_period, presence: true
  validates :task_status, presence: true
  validates :priority, presence: true
  validates :author, presence: true
  enum task_status: { not_started: 0,started_in: 1, complete: 2}
  enum priority: { low: 0, medium: 1, high: 2}
  

scope :task_name_search, -> (task_name) {
    next if task_name.blank?
    where(['task_name LIKE ?', "%#{task_name}%" ])
}
scope :task_status, -> (task_status) {
    next if task_status.blank?
    where(task_status: task_status)
}
 
end
