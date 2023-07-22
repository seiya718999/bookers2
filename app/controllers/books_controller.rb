class BooksController < ApplicationController
  def new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end

  def index
    @user = User.find(current_user.id)
    @book = Book.new
    @books = Book.all
  end

  def show
    @user = User.find(current_user.id)
    @book = Book.new
    @abook = Book.find(params[:id])
  end
  
  def edit
    @abook = Book.find(params[:id])
  end
  
  def destroy
    
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
