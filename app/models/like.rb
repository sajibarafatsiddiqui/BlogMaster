class Like < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User'

  scope :total_likes_by_post, ->(post_id) { where('post_id = ?', post_id).count if post_id.present? }
  def update_likes_counter
    post.update(likescounter: self.class.total_likes_by_post(post))
    post.likescounter
  end
end
