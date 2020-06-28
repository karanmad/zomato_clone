class Restaurant < ApplicationRecord
  belongs_to :restaurant_category
  has_many :food_items, dependent: :destroy
  validates :restaurant_name, :address, :phone_no, :email, presence: true
  validates :restaurant_category_id, presence: true
  has_attached_file :image
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
