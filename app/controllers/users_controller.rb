class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      flash[:success] = "Welcome to book collection App!"
      log_in @user
      redirect_to @user
      #if the user_params entered are valid set user as the user being created
      #make make the session[:id] the user.id
      #redirect to the user (user_path(user))
    else
      render :new
    end

  end

  def show
    @user = User.find(params[:id])
    @user_genres = @user.genres.uniq
    if @user_genres.nil?
      @genres_in_database = Genre.all.uniq
      render :show
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :email)
  end
end
