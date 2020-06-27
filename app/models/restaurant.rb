class Restaurant < ApplicationRecord
  belongs_to :restaurant_category
  has_many :food_items
  validates :restaurant_name, :address, :phone_no, :email, presence: true
  validates :restaurant_category_id, presence: true
end
