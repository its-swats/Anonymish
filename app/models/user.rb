class User < ActiveRecord::Base
  has_secure_password

  validates :username, presence: true
  validates :zip_code, presence: true

  has_many :posts, through: :users_posts
  has_many :users_posts


end