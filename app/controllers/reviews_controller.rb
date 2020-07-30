class ReviewsController < ApplicationController
  before_action :set_restaurant, only: [:new, :show]
  before_action :set_review, only: [:edit, :update, :destroy]
  before_action :require_user, except: [:show]
  before_action :not_admin, only: [:new, :create]

  def new
    @review = Review.new  
  end

  def create
    @review = current_user.reviews.new(review_params)
    
    unless @review.save
      redirect_back fallback_location: new_review_path, flash: { danger:  "check the inputs!" }
    else
      redirect_to restaurant_path(@review.restaurant_id), flash: { success: "Thanks for giving review!" }
    end
  end
  
  def show
    @review = @restaurant.reviews.where(approve: true).all
  end

  def edit
  end

  def update
    unless @review.update(review_edit_params)
      redirect_back fallback_location: edit_review_path,  flash: { danger:  "check the inputs!" }
    else
      redirect_to review_path(restaurant: @review.restaurant.id), flash: { success: "review updated succesfully!"}
    end
  end
  
  def destroy
    @restaurant = @review.restaurant
    @review.destroy
    redirect_to review_path(restaurant: @restaurant.id), flash: { success: "review deleted succesfully!"}
  end

  private

  def review_params
    params.require(:review).permit(:restaurant_id, :rating, :feedback, files: [], pictures: [], photos: [])
  end

  def review_edit_params
    params.require(:review).permit(:rating, :feedback)
  end

  def set_review
    @review = Review.find(params[:id])
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant])
  end

end
