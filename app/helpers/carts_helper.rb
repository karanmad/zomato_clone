# frozen_string_literal: true

module CartsHelper
  def current_cart
    @cart ||= current_user.carts.last
  end
end
