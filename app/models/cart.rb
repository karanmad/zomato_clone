class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  belongs_to :user
  def item_count
    cart_items.count
  end

  def total
    cart_items.collect {|item| item.valid? ? item.subtotal : 0 }.sum
  end
end
