class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def sign_in_user(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

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
