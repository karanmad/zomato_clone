class UsersController < ApplicationController
  
  def index
  end
  
  def new
    @user=User.new
  end

  def create
    @user=User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to :root
    else
      render "new"
    end
  end

  def show
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user=User.find(params[:id])

    unless @user.update(edit_profile)
      render "edit"
    else
      render "show"
    end
  end
    

  def user_params
    params.require(:user).permit(:Username, :email, :password, :password_confirmation)
  end

  def edit_profile
    params.require(:user).permit(:Username, :password, :password_confirmation)
  end
end
