class CartsController < ApplicationController
 before_action :require_user, only: [:show]
 
  def show
    @cart_items = current_cart.cart_items.all
  end

  def error
  end
end
