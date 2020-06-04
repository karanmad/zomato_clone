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
      redirect_to "/users/:id"
    else
      flash[:errors] = user.errors.full_messages
      redirect_to "/users/new"
    end
  end

  def show
    
  end
    

  def user_params
    params.require(:user).permit(:Username, :email, :password, :password_confirmation)
  end
end
