class ReviewsController < ApplicationController
  before_action :set_restaurant, only: [:new, :show]
  before_action :set_review, only: [:edit, :update, :destroy, :approve_request, :reject]
  before_action :require_user, except: [:show]
  before_action :only_user, only: [:new, :create]
  before_action :require_admin, only: [:unapprove, :approve_request, :reject]

  def new
    @review = Review.new  
  end

  def create
    @review = current_user.reviews.new(review_params)
    
    unless @review.save
      redirect_back fallback_location: new_review_path, flash: { danger:  "check the inputs![feedback minimum 2 chacters required" }
    else
      redirect_to restaurant_path(@review.restaurant_id), flash: { success: "Thanks for giving review, your review is send to admin for approval!" }
    end
  end
  
  def show
    @review = @restaurant.reviews.where(approve: true).all
  end

  def edit
  end

  def update
    unless @review.update(review_params)
      redirect_to edit_review_path,  flash: { danger:  "check the inputs!" }
    else
      unset_review
      redirect_to review_path(restaurant: @review.restaurant.id), flash: { success: "review updated and sent for approval!"}
    end
  end
  
  def destroy
    @restaurant = @review.restaurant
    @review.destroy
    redirect_to review_path(restaurant: @restaurant.id), flash: { success: "review deleted succesfully!"}
  end

  def unapprove
    @review = Review.where(approve: false).all
  end

  def approve_request
    unless !!approve_review
      render "unapprove"
    else
      redirect_to unapprove_reviews_path, flash: { success: "Approved successfully!" } 
    end
  end

  def reject
    @review.destroy
    redirect_to unapprove_reviews_path, flash: { success: "review rejected!" }
  end
  
  private

  def review_params
    params.require(:review).permit(:restaurant_id, :rating, :feedback, files: [], pictures: [], photos: [])
  end

  def set_review
    @review = Review.find(params[:id])
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant])
  end

end
