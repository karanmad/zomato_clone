# frozen_string_literal: true

class CartItem < ApplicationRecord
  belongs_to :food_item
  belongs_to :cart

  validates_uniqueness_of :food_item_id, scope: :cart_id
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 20 }

  def subtotal
    food_item.price * quantity
  end
end
