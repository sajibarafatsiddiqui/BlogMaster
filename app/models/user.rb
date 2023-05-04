class User < ApplicationRecord
  has_many :posts, foreign_key: 'author'
  has_many :comments, foreign_key: 'author'
  has_many :likes, foreign_key: 'author'

  def first_three_post
    posts.limit(1)
  end
end
