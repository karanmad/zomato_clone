class PagesController < ApplicationController
  before_action :set_review ,only: [:approve_request, :destroy]
  before_action :require_user, only: [:edit, :update, :menu, :approve, :approve_request, :destroy]
  before_action :require_admin, only: [:edit, :update, :approve, :approve_request, :destroy]

  def menu
    @restaurant = Restaurant.find(params[:restaurant])
  end
  
  def show
  end
  
  def index
    @restaurant = Restaurant.all
  end

  def edit
    @restaurant = Restaurant.find(params[:format])
  end

  def update
    @restaurant = Restaurant.find(params[:format])
    
    unless params[:restaurant].nil?
      unless @restaurant.update(image_params)
        render "edit"
      else
        redirect_to restaurant_list_path, flash: { success: "Image is successfully uploaded!" }
      end
    else
      flash[:danger] = "you have not selected anything!"
      render "edit"
    end
  end

  def approve
    @review = Review.where(approve: false).all
  end

  def approve_request
    unless @review.update(approve: "true")
      render "approve"
    else
      redirect_to request_path, flash: { success: "Approved successfully!" }
    end
  end

  def destroy
    @review.destroy
    redirect_to request_path, flash: { success: "review deleted successfully!" }
  end
  
  def map
    @restaurant = Restaurant.find(params[:restaurant])
  end
  
  private
  def image_params
    params.require(:restaurant).permit(files: [], pictures: [], photos: [])
  end
 
  def set_review
    @review = Review.find(params[:format])
  end

end
