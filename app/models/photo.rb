class Photo < ApplicationRecord
  # Photos have many comments, a comment belongs to a photo
  has_many :comments
  # Photos have many likes, a like belongs to a photo
  has_many :likes
  # Similarly, Photos have many fans through likes (source: user):
  has_many :fans, :through => :likes, :source => :user
  # user_id: presence
  validates :user_id, :presence => true
end
