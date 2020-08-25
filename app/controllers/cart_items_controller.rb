class CartItemsController < ApplicationController
  before_action :set_cart, only: [:update, :destroy]
  before_action :require_user
  before_action :only_user

  def add
    cart = current_cart.cart_items.new(cart_items_params)
    restaurant ||= cart.food_item.restaurant_id
    require_same_restaurant
    unless cart.save
      redirect_to menu_restaurant_path(restaurant), flash: { danger: "fooditem already added!" }
    else
      redirect_to menu_restaurant_path(restaurant), flash: { success: "item added!" }
    end
  end

  def update
    unless @cart_item.update(cart_items_params)
      redirect_to cart_path, flash: { danger: "quantity must be greater than 0 and less than equal to 20" }
    else
      redirect_to cart_path, flash: { success: "cartitem updated successfully!" }
    end
  end

  def destroy
    @cart_item.destroy
    redirect_to cart_path, flash: { success: "fooditem is removed successfully!" }
  end

  private

  def cart_items_params
    params.require(:cart_item).permit(:food_item_id, :quantity)
  end

  def set_cart
    @cart_item = CartItem.find(params[:id])
  end
end
