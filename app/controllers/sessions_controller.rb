class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success]="logged in successfully!"
      redirect_to "/restaurants"
    else
      flash[:danger] = "credential doesn't match!"
      redirect_to "/login"
    end
  end

  def destroy
    reset_session
    flash[:success]="logged out successfully!"
    redirect_to :root
  end


end
