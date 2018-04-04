class Chapter < ApplicationRecord
  validates :chapter_title, length: { maximum: 255 }
  validates :content, presence: true, length: { maximum: 10000 }
  validates :active, inclusion: { in: [true, false] }
  validates :novel_id, presence: true
  belongs_to :novel
end