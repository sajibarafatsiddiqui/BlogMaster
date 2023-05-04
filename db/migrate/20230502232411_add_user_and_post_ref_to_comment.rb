class AddUserAndPostRefToComment < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :post, references: :posts, foreign_key: true
    add_reference :comments, :author, references: :users, foreign_key: true
  end
end
