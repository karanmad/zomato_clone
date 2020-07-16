class Restaurant < ApplicationRecord
  geocoded_by                       :address
  after_validation                  :geocode
  belongs_to                        :restaurant_category
  has_many                          :food_items, dependent: :destroy
  has_many                          :book_tables
  validates                         :restaurant_name, :address, :phone_no, :email, :table_price, presence: true
  validates                         :restaurant_category_id, presence: true
  validates                         :phone_no, numericality: { only_integer: true}, length: 10..10
  validates                         :table_price,  numericality: { only_integer: true}
  has_attached_file                 :image
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  VALID_EMAIL_REGEX = 	/\A[\w+\-,]+@[a-z\d\-,]+\.[a-z]+\z/i
  validates                         :email, format: { with: VALID_EMAIL_REGEX }, uniqueness: { :case_sensitive => false}
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  
end
