# frozen_string_literal: true

# class Add Attachment Book Img To Books
class AddAttachmentBookImgToBooks < ActiveRecord::Migration[6.1]
  def self.up
    change_table :books do |t|
      t.attachment :book_img
    end
  end

  def self.down
    remove_attachment :books, :book_img
  end
end
