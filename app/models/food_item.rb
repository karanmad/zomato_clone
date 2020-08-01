class FoodItem < ApplicationRecord
  VALID_NAME_REGEX = /\A[\sA-Za-z]*\z/i

  belongs_to :restaurant
  has_many :cart_items, dependent: :destroy

  after_save :reindex

  validates :name, presence: true, length: { maximum: 25, minimum:2 }, format: {with: VALID_NAME_REGEX }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 1 }

  def reindex
    restaurant.__elasticsearch__.index_document
   end
end
