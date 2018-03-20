class BooksController < ApplicationController
  before_action :provide_book, only: [:show, :destroy, :edit, :update, :rating]

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book), notice: "The book has been successfully added"
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to book_path(@book)
    else
      render 'edit'
    end
  end

  def destroy
    @book.destroy
    redirect_to books_path
  end

  def rating
    rating = @book.rate
    votes_quantity = @book.votes_quantity
    total_of_grades = rating * votes_quantity
    votes_quantity += 1
    rating = (total_of_grades + params[:rate].to_f)/votes_quantity
    @book.rate = rating
    @book.votes_quantity = votes_quantity
    @book.save
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :description, :publishing_house, :image)
  end

  def provide_book
    @book = Book.find(params[:id])
  end
end
