class Post < ActiveRecord::Base
    validates :content, presence: true

    has_many :users, through: :users_posts
    has_many :users_posts
  
end
