class BooksController < ApplicationController
  before_action :provide_book, only: [:show, :destroy, :edit, :update]

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.save
    redirect_to book_path(@book), notice: "The book has been successfully added"
  end

  def show
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :description, :publishing_house, :image)
  end

  def provide_book
    @book = Book.find(params[:id])
  end
end
