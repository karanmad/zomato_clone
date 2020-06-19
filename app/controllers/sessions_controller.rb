class SessionsController < ApplicationController

  def new
  redirect_to users_path if logged_in?
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success]="logged in successfully!"
      redirect_to :root
    else
      flash[:danger] = "Either email or password is wrong!"
      redirect_to "/login"
    end
  end

  def destroy
    reset_session
    flash[:success]="logged out successfully!"
    redirect_to :root
  end


end
