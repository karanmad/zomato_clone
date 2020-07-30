class OrdersController < ApplicationController
  before_action :require_user
  before_action :not_admin
 
  def create
    order = Order.new(order_params)
    if order.save
      place_order
      redirect_to order_show_path, flash: { success: "Order is placed successfully!" }
    else
      render cart_path      
    end
  end  

  def show
    @placed_cart = current_user.carts.where(final: true).last
  end
  
  private
  
  def order_params
    params.require(:order).permit(:cart_id, :address)
  end

end
