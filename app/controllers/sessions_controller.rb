class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to "/restaurants"
    else
      flash[:errors] = ["email or password doesn't match!"]
      redirect_to "/login"
    end
  end

  def destroy
    reset_session
    redirect_to :root
  end


end
