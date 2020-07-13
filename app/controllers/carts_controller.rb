class CartsController < ApplicationController

  def show
    @cart = get_cart
    @cart_items = @cart.cart_items.all
  end
  
end
