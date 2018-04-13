class ReviewsController < ApplicationController
  before_action :provide_book, only: [:create, :destroy]

  def create

    @review = Review.new(review_params.merge(book: @book))

    if @review.save
      redirect_to book_path(@book)
    else
      render 'books/show'
    end
  end

  def destroy
    @review = @book.reviews.find(params[:id])
    @review.destroy
    redirect_to book_path(@book)
  end
  private

  def provide_book
    @book = Book.find(params[:book_id])
  end

  def review_params
    params.require(:review).permit(:name, :contents, :book_id)
  end

end
