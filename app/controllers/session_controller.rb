class SessionController < ApplicationController
  def new
  end

  def create
    session[:id] = params[:name]
    redirect_to books_path
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
