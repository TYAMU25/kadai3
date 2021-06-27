
class BooksController < ApplicationController
  before_action :correct_post,only: [:edit]

  def new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
    flash[:notice] = "successfully"
    redirect_to book_path(@book)

    else
      @books= Book.all
      @user = current_user
      render :index
    end
  end

  def index
    @book= Book.new
    @books = Book.all
    @user = current_user
  end

  def show
    @mybook = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def edit
        @book = Book.find(params[:id])
  end

  def update
        @book = Book.find(params[:id])
        if @book.update(book_params)
           flash[:notice] = "successfully"
            redirect_to book_path(@book)
        else
            render :edit
        end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end
  private
  def correct_post
        @book = Book.find(params[:id])
    unless @book.user.id == current_user.id
      redirect_to books_path
    end
end
    def book_params
        params.require(:book).permit(:title, :body)
    end
end
