class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:sessions][:username])
    if user && user.authenticate(params[:sessions][:password])
      log_in user
      redirect_to user
      else
        flash[:danger] = 'Invalid Username/password combination'
        render 'new'
      end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
