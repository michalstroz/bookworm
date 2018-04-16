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
    if @book.user_id != current_user.id
      redirect_to book_path(@book), notice: "You have no access to delete this comment."
    else
      @review = @book.reviews.find(params[:id])
      @review.destroy
      redirect_to book_path(@book)
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
