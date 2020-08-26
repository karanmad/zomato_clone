class PromotionsController < ApplicationController
  before_action :require_user
  before_action :require_admin

  def index
    @promotion = Promotion.all
  end

  def new
    @promotion = Promotion.new
  end

  def create
    @promotion = Promotion.new(promotion_params)

    if @promotion.save
      redirect_to new_promotion_path, flash: {success: "created succesfully!"}
    else
      render "new"
    end
  end

  def active
    @promotion = Promotion.where(['valid_date >= ?', DateTime.now])
  end

  def expired
    @promotion = Promotion.where(['valid_date < ?', DateTime.now])
  end

  def discount_ascend
    @promotion = Promotion.order(:discount_percent)
    render "index"
  end

  def discount_descend
    @promotion = Promotion.order(:discount_percent).reverse
    render "index"
  end

  def date_ascend
    @promotion = Promotion.order('valid_date ASC')
    render "index"
  end

  def date_descend
    @promotion = Promotion.order('valid_date DESC')
    render "index"
  end

  private
  
  def promotion_params
    params.require(:promotion).permit(:coupon_code, :valid_date, :minimum_amount, :discount_percent)
  end
  
end
