class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User'

  scope :total_comments_by_post, ->(post_id) { where('post_id = ?', post_id).count if post_id.present? }
  def update_comments_counter
    post.update(commentscounter: self.class.total_comments_by_post(post))
    post.commentscounter
  end
end
