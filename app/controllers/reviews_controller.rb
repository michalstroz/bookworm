class ReviewsController < ApplicationController
  before_action :provide_book, only: [:create, :destroy]

  def create
    @review = Review.new(review_params.merge(book: @book))
    if @review.safe
      redirect_to book_path(@book)
    else
      render 'books/show'
    end
  end

  private

  def provide_book
    @book = Book.find(params[:book_id])
  end

  def review_params
    params.require(:review).permit(:name, :contents, :book_id)
  end

end
