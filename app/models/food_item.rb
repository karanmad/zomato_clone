class FoodItem < ApplicationRecord
  belongs_to :restaurant
  has_many :cart_items, dependent: :destroy
  after_save :reindex

  def reindex
    restaurant.__elasticsearch__.index_document
   end
end
