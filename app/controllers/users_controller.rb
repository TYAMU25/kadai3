class UsersController < ApplicationController
  before_action :correct_post,only: [:edit]
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end
  def update
    @user = User.find(params[:id])
   if @user.update(user_params)
    flash[:notice] = "successfully"
    redirect_to user_path(@user.id)
  else
    render :edit
  end


  end

  def index
    @book=Book.new
    @users=User.all
    @user =current_user
  end

  def edit
    @user= User.find(params[:id])

  end


  private
  def correct_post
        @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
end

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
