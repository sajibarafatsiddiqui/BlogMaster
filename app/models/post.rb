class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments, foreign_key: 'post_id', dependent: :destroy
  has_many :likes, foreign_key: 'post_id', dependent: :destroy
  after_save :update_posts_counter
  after_destroy_commit :update_posts_counter

  validates :title, presence: true, length: { maximum: 250 }
  validates :commentscounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likescounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :total_post_by_author, ->(author_id) { where('author_id = ?', author_id).count if author_id.present? }
  def update_posts_counter
    author.update(postscounter: self.class.total_post_by_author(author))
    author.postscounter
  end

  def last_five_comments
    comments.last(5)
  end
end
