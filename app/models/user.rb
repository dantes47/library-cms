# frozen_string_literal: true

# class User
class User < ApplicationRecord
  has_many :books, dependent: nil
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
