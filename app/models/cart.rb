# frozen_string_literal: true

class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_one :order, dependent: :destroy

  belongs_to :user

  def total
    cart_items.collect { |item| item.valid? ? item.subtotal : 0 }.sum
  end

  def placed_cart
    toggle!(:final)
  end

  def require_same_restaurant
    self.cart_items.delete_all unless self.cart_items.first.food_item.restaurant_id == self.cart_items.last.food_item.restaurant_id
  end
end
