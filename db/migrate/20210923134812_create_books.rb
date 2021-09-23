# frozen_string_literal: true

# Create Books
class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string   :title
      t.text     :description
      t.string   :author

      t.timestamps
    end
  end
end
