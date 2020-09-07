# frozen_string_literal: true

class PromotionsController < ApplicationController
  before_action :require_user
  before_action :require_admin

  def index
    if params[:filter_option] == '1'
      @promotion = Promotion.where(['valid_date >= ?', DateTime.now])
      return
    elsif params[:filter_option] == '2'
      @promotion = Promotion.where(['valid_date < ?', DateTime.now])
      return
    elsif params[:filter_option] == '3'
      @promotion = Promotion.order(:discount_percent)
      return
    elsif params[:filter_option] == '4'
      @promotion = Promotion.order(:discount_percent).reverse
      return
    elsif params[:filter_option] == '5'
      @promotion = Promotion.order('valid_date ASC')
      return
    elsif params[:filter_option] == '6'
      @promotion = Promotion.order('valid_date DESC')
      return
    else params[:filter_option] == ' '
         @promotion = Promotion.all
    end
    @promotion = Promotion.all
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
