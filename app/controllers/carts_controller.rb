class CartsController < ApplicationController

  def add
    cart = get_cart
    cart = cart.cart_items.new(cart_items_params)
    if cart.save
     redirect_back(fallback_location: menu_path)
    else
      flash[:danger] = "fooditem already added"
      redirect_back(fallback_location: menu_path)
    end
  end

  def cart_items_params
    params.require(:cart_item).permit(:food_item_id, :quantity)
  end
end
