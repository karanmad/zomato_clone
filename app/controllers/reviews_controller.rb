# frozen_string_literal: true

class ReviewsController < ApplicationController
  before_action :set_restaurant, only: %i[new show]
  before_action :set_review, only: %i[edit update destroy approve_request reject]
  before_action :require_user, except: [:show]
  before_action :only_user, only: %i[new create]
  before_action :require_admin, only: %i[unapprove approve_request reject]

  def new
    @review = Review.new
  end

  def create
    @review = current_user.reviews.new(review_params)

    if @review.save
      redirect_to restaurant_path(@review.restaurant_id), flash: { success: 'Thanks for giving review, your review is send to admin for approval!' }
    else
      redirect_back fallback_location: new_review_path, flash: { danger: 'feedback must contain minimum 2 characters' }
    end
  end

  def show
    @reviews = @restaurant.reviews.where(approve: true).all
  end

  def edit; end

  def update
    if @review.update(review_params)
      @review.unset_review
      redirect_to review_path(restaurant: @review.restaurant.id), flash: { success: 'review updated and sent for approval!' }
    else
      redirect_to edit_review_path, flash: { danger: 'check the inputs!' }
    end
  end

  def destroy
    @restaurant = @review.restaurant
    @review.destroy
    redirect_to review_path(restaurant: @restaurant.id), flash: { success: 'review deleted succesfully!' }
  end

  def unapprove
    @reviews = Review.where(approve: false).all
  end

  def approve_request
    if @review.approve_review
      redirect_to unapprove_reviews_path, flash: { success: 'Approved successfully!' }
    else
      render 'unapprove'
    end
  end

  def reject
    @review.destroy
    redirect_to unapprove_reviews_path, flash: { success: 'review rejected!' }
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
