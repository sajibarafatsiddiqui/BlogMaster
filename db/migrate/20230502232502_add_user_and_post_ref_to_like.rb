class AddUserAndPostRefToLike < ActiveRecord::Migration[7.0]
  def change
    add_reference :likes, :post, references: :posts, foreign_key: true
    add_reference :likes, :author, references: :users, foreign_key: true
  end
end
