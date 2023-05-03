# frozen_string_literal: true

class AddAuthorToPost < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :user, references: :users, foreign_key: true
  end
end
