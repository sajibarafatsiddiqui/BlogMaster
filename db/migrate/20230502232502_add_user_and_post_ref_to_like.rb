class AddUserAndPostRefToLike < ActiveRecord::Migration[7.0]
  def change
    add_reference :likes, :post, references: :posts, foreign_key: true
    add_reference :likes, :user, references: :users, foreign_key: true
  end
end
