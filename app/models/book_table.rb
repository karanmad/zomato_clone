class BookTable < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant

  def total
    return restaurant.table_price * heads
  end

end
