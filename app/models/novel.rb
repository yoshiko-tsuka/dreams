class Novel < ApplicationRecord
  belongs_to :user
  
  validates :title, presence: true, length: { maximum: 100 }
  validates :user_id, presence: true
  validates :atmosphere, presence: true, length: { maximum: 10 }
  validates :resume, presence: true, length: { maximum: 255 }
  validates :active, inclusion: { in: [true, false] }
  validates :dream, inclusion: { in: [true, false] }
  
  has_many :chapters
  
  
end
