# frozen_string_literal: true

# Books Controller
class BooksController < ApplicationController
  def index; end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(prms)
  end

  private

  def prms
    params.require(:book).permit(:title, :description, :author)
  end
end
