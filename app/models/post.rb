class Post < ActiveRecord::Base
    validates :content, presence: true
    acts_as_mappable

    has_many :users, through: :users_posts
    has_many :users_posts
  
end
