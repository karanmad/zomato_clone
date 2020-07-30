class CartItemsController < ApplicationController
  before_action :set_cart, only: [:update, :destroy]
  before_action :require_user
  before_action :not_admin

  def add
    cart = current_cart.cart_items.new(cart_items_params)
    require_same_restaurant
    unless cart.save
      redirect_back fallback_location: menu_path , flash: { success: "fooditem already added!" }
    else
      redirect_back(fallback_location: menu_path)
    end
  end

  def update
    unless @cart_item.update(cart_items_params)
      render cart_path
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
