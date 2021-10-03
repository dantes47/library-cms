# frozen_string_literal: true

# Books Controller
class BooksController < ApplicationController
  before_action :find_book, only: %i[show edit update destroy]
  before_action :authenticate_user!, only: %i[new edit]

  def index
    if params[:category].blank?
      @books = Book.all.order('created_at DESC')
    else
      @category_id = Category.find_by(name: params[:category]).id
      @books = Book.where(category_id: @category_id).order('created_at DESC')
    end
  end

  def show
    @average_review = if @book.reviews.blank?
                        '0'
                      else
                        @book.reviews.average(:rating).round(2)
                      end
  end

  def new
    @book = current_user.books.build
    @categories = Category.all.map { |cat| [cat.name, cat.id] }
  end

  def create
    @book = current_user.books.build(prms)
    @book.category_id = params[:category_id]

    if @book.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @categories = Category.all.map { |cat| [cat.name, cat.id] }
  end

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
    params.require(:book).permit(
      :title, :description, :author, :coauthor,
      :category, :category_id, :book_img
    )
  end

  def find_book
    @book = Book.find(params[:id])
  end
end
