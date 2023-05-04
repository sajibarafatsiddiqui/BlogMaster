class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  scope :total_post_by_author, ->(author_id) { where('author_id = ?', author_id).count if author_id.present? }
  def update_posts_counter(user_id)
    user_id.update(postscounter: self.class.total_post_by_author(user_id))
  end

  def last_five_comment
    comments.last(5)
  end
end
