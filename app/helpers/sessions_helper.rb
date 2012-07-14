module SessionsHelper
  def signed_in?
    !!self.current_user
  end
  alias :logged_in? :signed_in?

  def sign_out
    session[:user_id] = nil
    self.current_user = nil
  end

  def current_user=(user)
    @current_user = user
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end
end
