class User < ActiveRecord::Base
  has_many :posts, through: :users_posts
  has_many :users_posts


end