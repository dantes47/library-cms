# frozen_string_literal: true

# Books Controller
class BooksController < ApplicationController
  before_action :find_book, only: %i[show edit update destroy]

  def index
    @books = Book.all.order('created_at DESC')
  end

  def show; end

  def new
    @book = current_user.books.build
  end

  def create
    @book = current_user.books.build(prms)

    if @book.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @book.update(prms)
      redirect_to book_path(@book)
    else
      render 'edit'
    end
  end

  def destroy
    @book.destroy

    redirect_to root_path
  end

  private

  def prms
    params.require(:book).permit(:title, :description, :author, :coauthor)
  end

  def find_book
    @book = Book.find(params[:id])
  end
end
