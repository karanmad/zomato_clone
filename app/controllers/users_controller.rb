class UsersController < ApplicationController
  def index
  end
  
  def new
    @user=User.new
  end

  def create
    user=User.new(user_params)

    if user.save
      session[:user_id] = user.id
      redirect_to "/restaurants"
    else
      flash[:errors] = user.errors.full_messages
      redirect_to "/signup"
    end
  end

 
    

  def user_params
    params.require(:user).permit(:Username, :email, :password, :password_confirmation)
  end
end
