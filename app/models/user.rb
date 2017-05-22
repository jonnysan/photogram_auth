class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
# Users have many photos, a photo belongs to a user
has_many :photos
# Users have many comments, a comment belongs to a user
has_many :comments
# Users have many likes, a like belongs to a user
has_many :likes
# Users have many liked_photos through likes. Since this breaks naming conventions (the method name, .liked_photos, does not exactly match the class name, Photo), we'll have to write out the full form of the has_many/through:
has_many :liked_photos, :through => :likes, :source => :photo
# username: presence, uniqueness
validates :username, :presence => true, :uniqueness => true
end
