class User < ApplicationRecord
  validates :user_name, presence: true, length: { maximum: 50 }
  validates :user_code, presence: true, uniqueness: true, length: { maximum: 50 }
  validates :profile, presence: true,length: { maximum: 255 }
  has_secure_password
  
  has_many :novels
  
  has_many :relationships
  has_many :followings, through: :relationships, source: :follow
  has_many :reverses_of_relationship, class_name: 'Relationship', foreign_key: 'follow_id'
  has_many :followers, through: :reverses_of_relationship, source: :user
  
  has_many :friendships
  
  has_many :likes
  has_many :like_novels, through: :likes, class_name: 'Novel', source: :novel
  has_many :subscribes
  has_many :subscribe_novels, through: :subscribes, class_name: 'Novel', source: :novel
  
  def follow(other_user)
    unless self == other_user
      self.relationships.find_or_create_by(follow_id: other_user.id)
    end
  end

  def unfollow(other_user)
    relationship = self.relationships.find_by(follow_id: other_user.id)
    relationship.destroy if relationship
  end

  def following?(other_user)
    self.followings.include?(other_user)
  end
  
  def like(novel)
    self.likes.find_or_create_by(novel_id: novel.id)
  end

  def unlike(novel)
    like = self.likes.find_by(novel_id: novel.id)
    like.destroy if like
  end

  def like?(novel)
    self.like_novels.include?(novel)
  end
  
  def subscribe(novel)
    self.subscribes.find_or_create_by(novel_id: novel.id)
  end

  def unsubscribe(novel)
    subscribe = self.subscribes.find_by(novel_id: novel.id)
    subscribe.destroy if subscribe
  end

  def subscribe?(novel)
    self.subscribe_novels.include?(novel)
  end
end
