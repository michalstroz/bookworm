class BooksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :provide_book, only: [:show, :destroy, :edit, :update, :rating]
  before_action :get_all_books, only:[:index, :best_books]

  def index
    @books = @books.paginate(:page => params[:page], :per_page => 10).includes(:user)
    if params[:order].present?
      @books = @books.order(rate: params[:order])
    end
    if params[:title].present?
      @books = @books.where("title ilike ?", "%#{params[:title]}%")
    end
    if params[:author].present?
      @books = @books.where("author ilike ?", "%#{params[:author]}%")
    end
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
    @review = Review.new
  end

  def edit
    if current_user.nil?
      redirect_to book_path, notice: "You have no access to edit this book."
    else
      if @book.user_id != current_user.id
        redirect_to book_path, notice: "You have no access to edit this book."
      end
    end
  end

  def update
    if @book.update(book_params)
      redirect_to book_path(@book)
    else
      render 'edit'
    end
  end

  def destroy
    if current_user.nil?
      redirect_to book_path, notice: "You have no access to delete this book."
    else
      if @book.user_id != current_user.id
        redirect_to book_path, notice: "You have no access to delete this book."
      else
        @book.destroy
        redirect_to books_path
      end
    end
  end

  def rating
    rating = @book.rate
    votes_quantity = @book.votes_quantity
    total_of_grades = rating * votes_quantity
    votes_quantity += 1
    rating = (total_of_grades + params[:rate].to_f)/votes_quantity
    @book.rate = rating
    @book.votes_quantity = votes_quantity
    respond_to do |format|
      if @book.save
        session["book-marked-#{@book.id}"] = true
        format.html { redirect_to @book, notice: 'Thank You for your vote.' }
      end
    end
  end

  def best_books
    @books = BestBooksFetcher.new(100).fetch
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :description, :publishing_house, :image)
        .merge(user: current_user)
  end

  def provide_book
    @book = Book.find(params[:id])
  end

  def get_all_books
    @books = Book.all
  end
end
