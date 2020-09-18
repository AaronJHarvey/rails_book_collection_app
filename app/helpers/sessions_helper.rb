module SessionsHelper

  # Logs in the given user.
  def log_in(user)
    session[:id] = user.id
  end

  def current_user
     @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
   !current_user.nil?
 end

 def redirect_if_not_logged_in
   if !logged_in?
     redirect_to login_path
   end
 end

 def log_out
    session.delete(:user_id)
    @current_user = nil
  end

 def current_user_books
   @books = current_user.books
 end
end
