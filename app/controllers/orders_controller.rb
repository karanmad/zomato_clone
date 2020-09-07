# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :require_user
  before_action :only_user

  def create
    order = Order.new(order_params)

    if get_cart.cart_items.first
      if order.save
        current_cart.placed_cart
        redirect_to orders_path, flash: { success: 'Order is placed successfully!' }
      else
        redirect_to cart_path, flash: { danger: 'address length must be more than 5 charcters!' }
      end
    else
      redirect_to cart_path, flash: { danger: 'Your cart is empty must select the items to order!' }
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
