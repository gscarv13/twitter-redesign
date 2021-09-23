class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, length: { minimum: 3, maximum: 20 }
  validates :full_name, presence: true, length: { minimum: 3, maximum: 20 }

  has_many :posts, class_name: 'Post', foreign_key: 'author_id'
  has_many :followers, class_name: 'Following', foreign_key: 'follower_id'
  has_many :followed, class_name: 'Following', foreign_key: 'followed_id'

  mount_uploader :photo, ImageUploader
  mount_uploader :cover_image, ImageUploader
end
