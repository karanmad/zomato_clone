# frozen_string_literal: true

class PromotionsController < ApplicationController
  before_action :require_user
  before_action :require_admin

  def index
    @promotions = Promotion.all
    @promotions = @promotions.sort_by_params(params[:promotion_sort]) if params[:promotion_sort]
    @promotions = @promotions.filter_by_params(params[:filter]) if params[:filter]
  end

  def new
    @promotion = Promotion.new
  end

  def create
    @promotion = Promotion.new(promotion_params)

    if @promotion.save
      redirect_to new_promotion_path, flash: { success: 'created succesfully!' }
    else
      render 'new'
    end
  end

  private

  def promotion_params
    params.require(:promotion).permit(:coupon_code, :valid_date, :minimum_amount, :discount_percent)
  end
end
