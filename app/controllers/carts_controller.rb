class CartsController < ApplicationController
 before_action :require_user
 
  def show
    @cart_items = current_cart.cart_items.all
  end
  
end
