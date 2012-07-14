class SessionsController < Devise::OmniauthCallbacksController
  def xrono
    omniauth = env['omniauth.auth']
    logger.debug "+++ #{omniauth}"

    user = User.find_by_email(omniauth['info']['email'])
    if not user
      # New user registration
      user = User.create!(email: omniauth['info']['email'])
    end

    # Currently storing all the info
    session[:user_id] = user.id

    flash[:notice] = "Successfully logged in"
    redirect_to root_path
  end
end
