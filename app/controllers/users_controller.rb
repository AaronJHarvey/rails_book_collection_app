class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      redirect_to books_path
      #if the user_params entered are valid set user as the user being created
      #make make the session[:id] the user.id
      #redirect to the user (user_path(user))
    else
      render :new
    end

  end

  def show
    @User = User.find_by_id(id: params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
