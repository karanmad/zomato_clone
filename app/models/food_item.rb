# frozen_string_literal: true

class FoodItem < ApplicationRecord
  VALID_NAME_REGEX = /\A[\sA-Za-z]*\z/i.freeze
  belongs_to :restaurant

  has_many :cart_items, dependent: :destroy

  validates_uniqueness_of :name, scope: :restaurant_id, case_sensitive: false
  validates :name, presence: true, length: { maximum: 35, minimum: 2 }, format: { with: VALID_NAME_REGEX }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 1 }

  after_save :reindex

  def reindex
    restaurant.__elasticsearch__.index_document
  end
end
