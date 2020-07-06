class CartItem < ApplicationRecord
  belongs_to :food_item
  belongs_to :cart
  validates_uniqueness_of :food_item_id, scope: :cart_id
end
