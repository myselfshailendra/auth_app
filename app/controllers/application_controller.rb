class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def sign_in_user(user)
    session[:user_id] = user.id
  end

  def create_cookies(user)
    authentication = user.authentications.create
    cookies[:auth_token] = {value: authentication.auth_token, expires: Time.now + 2.week}
  end

  def current_user
    current_user_by_cookies
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    @current_user
  end
  helper_method :current_user

  def current_user_by_cookies
    if cookies[:auth_token]
      authentication = Authentication.find_by(auth_token: cookies[:auth_token])
      @current_user ||= authentication.user if authentication
    end
  end

  def authenticate_user!
    if current_user
      return true
    else
      flash[:error] = "You are unauthorized to perform this action, please login."
      redirect_to sign_in_path
    end
  end

  def already_logged_in?
    redirect_to :dashboard_index if current_user
  end
end
