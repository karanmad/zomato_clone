class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  belongs_to :user
  def item_count
    cart_items.count
  end
end
