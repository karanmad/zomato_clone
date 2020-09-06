module CartsHelper

  def get_cart
    if current_user.carts.count > 0 && !current_user.carts.last.final
      current_cart
    else
      set_cart
    end
  end
    
  def set_cart
    @cart = current_user.carts.create
  end

  def current_cart
    @cart ||= current_user.carts.last
  end
end
