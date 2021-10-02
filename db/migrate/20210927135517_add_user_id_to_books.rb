# frozen_string_literal: true

# class Add User Id To Books
class AddUserIdToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :user_id, :integer
  end
end
