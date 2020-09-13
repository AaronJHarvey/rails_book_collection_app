class SessionController < ApplicationController
  def new
  end

  def create
    user = find_by_name(params[:session][:name])
    if user
      session[:id] = @user.id
    else
      redirect_to 'session/new'
    end
  end

  def destroy
    @user = session[:id]
    @user.session.de
    session.delete :id
    redirect_to root_path
  end
end
