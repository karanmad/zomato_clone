module CartsHelper
  def get_cart
    unless session[:cart_id]
      unless !!current_user.carts.last
        set_cart
      else
        @cart = current_user.carts.last
      end
    else
      @cart = Cart.find(session[:cart_id])
    end
  end
    
  def set_cart
    @cart = Cart.create
    session[:cart_id] = @cart.id
    @cart
  end
end
