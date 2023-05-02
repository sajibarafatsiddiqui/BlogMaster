class AddUserAndPostRefToComment < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :post, references: :posts, index: true
    add_reference :comments, :user, references: :users, index: true
  end
end
