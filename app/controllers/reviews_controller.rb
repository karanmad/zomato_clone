class ReviewsController < ApplicationController

  def new
    @restaurant = Restaurant.find(params[:restaurant])
    @review = Review.new  
  end

  def create
    @review = current_user.reviews.new(review_params)
    
    unless @review.save
      flash[:danger] = "check the inputs!"
      redirect_back(fallback_location: menu_path)
    else
      redirect_to restaurant_path(@review.restaurant_id)
      flash[:success] = "Thanks for giving review!"
    end
  end

  private
  def review_params
    params.require(:review).permit(:restaurant_id, :rating, :feedback, files: [], pictures: [], photos: [])
  end
end
