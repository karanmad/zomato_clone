module CartsHelper

  def get_cart
    unless session[:cart_id]
      unless current_user.carts.count > 0 && !current_user.carts.last.final
        set_cart
      else
        @cart = current_user.carts.last
        session[:cart_id] = @cart.id
        @cart
      end
    else
      @cart ||= Cart.find(session[:cart_id])
    end
  end
    
  def set_cart
    @cart = current_user.carts.create()
    session[:cart_id] = @cart.id
    @cart
  end

  def require_same_restaurant
    unless @cart.cart_items.first.food_item.restaurant_id == @cart.cart_items.last.food_item.restaurant_id
      @cart.cart_items.delete_all
      flash[:warning] = "Previous cart items has been removed"
    end
  end
  
end
