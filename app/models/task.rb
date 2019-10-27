class Task < ApplicationRecord
  validates :task_name, presence: true, uniqueness: true, length:{ maximum:100}
  validates :task_details, presence: true, uniqueness: true, length:{ maximum:100}
  validates :end_period, presence: true
  validates :task_status, presence: true
  validates :priority, presence: true
  validates :author, presence: true
  enum task_status:{not_started: 0,started_in: 1,complete: 2}
  enum priority:{row: 0,medium: 1,high: 2}
  def self.search(search)
    if search
       where(['name LIKE ?', "%#{search}%"])
    else
       all
    end
 end
end