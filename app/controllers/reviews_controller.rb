# frozen_string_literal: true

class ReviewsController < ApplicationController
  before_action :find_book
  before_action :find_review, only: %i[edit update destroy]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(prms)
    @review.book_id = @book.id
    @review.user_id = current_user ? current_user.id : nil

    if @review.save
      redirect_to book_path(@book)
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @review.update(prms)
      redirect_to book_path(@book)
    else
      render 'edit'
    end
  end

  def destroy
    @review.destroy
    redirect_to book_path
  end

  private

  def prms
    params.require(:review).permit(:rating, :comment)
  end

  def find_book
    @book = Book.find(params[:book_id])
  end

  def find_review
    @review = Review.find(params[:id])
  end
end
