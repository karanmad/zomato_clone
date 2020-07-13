class OrdersController < ApplicationController
  def create
    order = current_user.orders.new(order_params)
    unless order.save
      render cart_path
    else
      cart = get_cart
      cart.final = true
      cart.order_id = order.id
      cart.save
      session[:cart_id] = nil
      order = nil
      flash[:success] = "Order is successfully placed!"
      redirect_to order_show_path
    end
  end  

  def show
    @placed_cart = current_user.carts.reverse.second
  end
  
  private
    def order_params
      params.require(:order).permit(:address)
    end

end
