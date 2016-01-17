class Post < ActiveRecord::Base
    has_many :users, through: :users_posts
    has_many :users_posts
  
end
