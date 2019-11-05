class User < ApplicationRecord
  before_destroy :admin_user
  has_many :tasks, dependent: :destroy
  validates :name,  presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  before_validation { email.downcase! }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  private

  #dependent: :destroyとすることで、userを削除するとtaskも一緒に削除される

  def admin_user
    throw(:abort) if User.where(admin:true).count < 2 && self.admin
  end
end
