class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to "/restaurants"
    else
      flash[:errors] = ["email or password doesn't match!"]
      redirect_to "/users/:id"
    end
  end
end
