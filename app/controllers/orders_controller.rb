class OrdersController < ApplicationController
  def create
    order = Order.new(order_params)
    if order.save
      place_order
      flash[:success] = "Order is successfully placed!"
      redirect_to order_show_path
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
