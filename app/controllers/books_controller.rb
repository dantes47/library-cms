# frozen_string_literal: true

# Books Controller
class BooksController < ApplicationController
  def index; end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(prms)

    if @book.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def prms
    params.require(:book).permit(:title, :description, :author)
  end
end
