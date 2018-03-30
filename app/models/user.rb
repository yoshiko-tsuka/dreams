class User < ApplicationRecord
  validates :user_name, presence: true, length: { maximum: 50 }
  validates :user_code, presence: true, uniqueness: true, length: { maximum: 50 }
  validates :profile, presence: true,length: { maximum: 255 }
  has_secure_password
end
