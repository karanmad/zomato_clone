class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]
  before_action :require_user, only: [:edit, :show]
  before_action :require_same_user, only: [:edit]
  def index
  end
  
  def new
    redirect_to users_path if logged_in?
    @user = User.new
  end

  def create
    @user = User.new(user_params)

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
  end

  def update
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

  def set_user
    @user = User.find(params[:id])
  end

  def require_same_user
    if current_user != @user
      flash[:danger] = "You can edit your own account!"
      redirect_to :error
    end
  end
end
