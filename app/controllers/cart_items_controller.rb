class CartItemsController < ApplicationController

  def add
    cart = get_cart.cart_items.new(cart_items_params)
    require_same_restaurant
    unless cart.save
      flash[:danger] = "fooditem already added"
      redirect_back(fallback_location: menu_path)
    else
      redirect_back(fallback_location: menu_path)
    end
  end

  def update
    @cart_item = CartItem.find(params[:id])
    unless @cart_item.update(cart_items_params)
      render cart_path
    else
      flash[:success] = "cart item updated!"
      redirect_to cart_path
    end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    flash[:success] = "food item successfully removed!"
    redirect_to cart_path
  end

  private
    def cart_items_params
      params.require(:cart_item).permit(:food_item_id, :quantity)
    end

end
