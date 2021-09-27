# frozen_string_literal: true

# class Category
class Category < ApplicationRecord
  has_many :books
end
