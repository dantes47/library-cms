# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :book
  belongs_to :user
end
