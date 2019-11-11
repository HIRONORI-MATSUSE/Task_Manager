class Task < ApplicationRecord
  belongs_to :user,optional: true
  validates :task_name, presence: true, length:{ maximum:100}
  validates :task_details, presence: true, length:{ maximum:100}
  validates :end_period, presence: true
  validates :task_status, presence: true
  validates :priority, presence: true
  validates :label_ids, presence: true

  enum task_status: { not_started: 0,started_in: 1, complete: 2}
  enum priority: { low: 0, medium: 1, high: 2}
  
  has_many :labelings, dependent: :destroy
  has_many :labels, through: :labelings, source: :label

  scope :recent, -> { order(created_at: :desc) }
  
  scope :task_name_search, -> (name_search) {
      next if name_search.blank?
      where(['task_name LIKE ?', "%#{name_search}%" ])
  }

  scope :task_status, -> (task_status) {
      next if task_status.blank?
      where(task_status: task_status)
  }
  scope :label_name_search, -> (label_search) {
      next if label_search.blank?
      Task.joins(:labels).where(['labels.name LIKE ?', "%#{label_search}%"])
  }
  # label_search = params[:task][:label_search]
  # @tasks = 
end
