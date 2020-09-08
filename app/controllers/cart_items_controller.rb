# frozen_string_literal: true

class CartItemsController < ApplicationController
  before_action :set_cart, only: %i[update destroy]
  before_action :require_user
  before_action :only_user

  def add
    @cart_item = current_cart.cart_items.new(cart_items_params)
    restaurant ||= @cart_item.food_item.restaurant_id
    current_cart.require_same_restaurant

    if @cart_item.save
      redirect_to menu_restaurant_path(restaurant), flash: { success: 'item added!' }
    else
      redirect_to menu_restaurant_path(restaurant), flash: { danger: 'fooditem already added!' }
    end
  end

  def update
    if @cart_item.update(cart_items_params)
      redirect_to cart_path, flash: { success: 'cartitem updated successfully!' }
    else
      redirect_to cart_path, flash: { danger: 'quantity must be greater than 0 and less than equal to 20' }
    end
  end

  def destroy
    @cart_item.destroy
    redirect_to cart_path, flash: { success: 'fooditem is removed successfully!' }
  end

  private

  def cart_items_params
    params.require(:cart_item).permit(:food_item_id, :quantity)
  end

  def set_cart
    @cart_item = CartItem.find(params[:id])
  end
end
