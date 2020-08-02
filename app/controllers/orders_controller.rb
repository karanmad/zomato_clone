class OrdersController < ApplicationController
  before_action :require_user
  before_action :only_user
 
  def create
    order = Order.new(order_params)
    if order.save
      place_order
      redirect_to orders_path, flash: { success: "Order is placed successfully!" }
    else
      render cart_path      
    end
  end  

  def index
    @placed_cart = current_user.carts.where(final: true).all.reverse
  end
  
  private
  
  def order_params
    params.require(:order).permit(:cart_id, :address)
  end

end
