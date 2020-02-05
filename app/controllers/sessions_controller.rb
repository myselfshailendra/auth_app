class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, except: :destroy
  before_action :already_logged_in?, except: :destroy

  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate_user(params[:password])
      sign_in_user(@user)
      redirect_to :dashboard_index
    else
      @errors = {password: ["Invalid credentials!"]}
    end
  end

  def destroy
    reset_session
    redirect_to :sign_in
  end
end