class Ownership < ApplicationRecord
  belongs_to :novel
  belongs_to :chapter
end
