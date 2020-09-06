class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_one :order, dependent: :destroy
  
  belongs_to :user
 
  def total
    cart_items.collect {|item| item.valid? ? item.subtotal : 0 }.sum
  end

  def placed_cart
    toggle!(:final)
  end

  def require_same_restaurant
    unless cart_items.first.food_item.restaurant_id == cart_items.last.food_item.restaurant_id
      cart_items.delete_all
    end
  end
end
