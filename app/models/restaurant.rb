class Restaurant < ApplicationRecord
  geocoded_by                       :address
  after_validation                  :geocode
  belongs_to                        :restaurant_category
  has_many                          :food_items, dependent: :destroy
  has_many                          :book_tables
  has_many                          :reviews, dependent: :destroy
  has_many                          :restaurant_uploads, dependent: :destroy
  has_many                          :food_uploads, dependent: :destroy
  has_many                          :menu_uploads, dependent: :destroy
  validates                         :restaurant_name, :address, :phone_no, :email, :table_price, presence: true
  validates                         :restaurant_category_id, presence: true
  validates                         :phone_no, numericality: { only_integer: true}, length: 10..10
  validates                         :table_price,  numericality: { greater_than_or_equal_to: 1 }
  has_attached_file                 :image
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  VALID_EMAIL_REGEX = 	/\A[\w+\-,]+@[a-z\d\-,]+\.[a-z]+\z/i
  validates                         :email, format: { with: VALID_EMAIL_REGEX }, uniqueness: { :case_sensitive => false}
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
   


  def files=(array_of_files = [])
    array_of_files.each do |f|
      restaurant_uploads.build(image: f, restaurant: self)
    end
  end

  def pictures=(array_of_pictures = [])
    array_of_pictures.each do |f|
      food_uploads.build(image: f, restaurant: self)
    end
  end

  def photos=(array_of_photos = [])
    array_of_photos.each do |f|
      menu_uploads.build(image: f, restaurant: self)
    end
  end

end
