class User < ApplicationRecord
  has_many :posts, class_name: 'Post', foreign_key: 'author'
  has_many :comments
  has_many :likes

  def first_three_post
    posts.limit(1)
  end
end
