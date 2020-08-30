class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  belongs_to :user
  has_one :order, dependent: :destroy
  
  def total
    cart_items.collect {|item| item.valid? ? item.subtotal : 0 }.sum
  end

  def placed_cart
    toggle!(:final)
  end
end
