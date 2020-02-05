class UsersController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :already_logged_in?

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    redirect_to sign_in_path, notice: "You signed up successfully" if @user.save
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :accept_terms)
  end
end