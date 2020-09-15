module UsersHelper
  def current_user
     @current_user ||= User.find_by(id: session[:user_id])
  end

  def current_user_id
    @user_id = current_user.id
  end
end
