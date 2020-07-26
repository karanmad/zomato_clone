module OrdersHelper

  def place_order
    current_cart.update(final: true)
  end
  
end
