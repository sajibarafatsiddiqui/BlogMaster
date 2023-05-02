class AddUserAndPostRefToLike < ActiveRecord::Migration[7.0]
  def change
    add_reference :likes, :post, references: :posts, index: true
    add_reference :likes, :user, references: :users, index: true
  end
end
