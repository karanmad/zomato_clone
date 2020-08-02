class SessionsController < ApplicationController
  before_action :require_user, only: [:destroy]

  def new
  redirect_to users_path if logged_in?
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to :root, flash: { success: "logged in successfully!" }
    else
      unless !user
        flash[:danger] = "Wrong Password!"
      else
        flash[:danger] = "Wrong Email!"
      end
      redirect_to login_path
    end
  end

  def destroy
    reset_session
    redirect_to :root, flash: { success: "logged out successfully!" }
  end

  def google_fb_create
    user = User.find_or_create_from_auth_hash(request.env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to root_path, flash: { success: "logged in successfully!" }
  end
  
end
