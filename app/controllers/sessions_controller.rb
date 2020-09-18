class SessionsController < ApplicationController
  def new
  end

  def create
    if auth_hash = request.env["omniauth.auth"]
      oauth_email = request.env["omniauth.auth"]["info"]["email"]
        if user = User.find_by(:email => oauth_email)
          log_in user
          redirect_to user
        else
          user = User.create(:email => oauth_email, :username => oauth_email, :password =>SecureRandom.hex)
          if user.save
            log_in user
            redirect_to user
          else
            raise user.errors.full_messages.inspect
          end
        end
    else
    user = User.find_by(:email => params[:email])
      if user && user.authenticate(params[:password ])
        log_in user
        redirect_to user
      else
        flash[:danger] = 'Invalid Login combination'
        render :new
      end
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
