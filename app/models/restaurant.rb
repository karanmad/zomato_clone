class Restaurant < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
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

  settings do
    mappings dynamic: false do
      indexes :restaurant_name, type: :text, analyzer: :english
      indexes :restaurant_category do
        indexes :name, type: "text", analyzer: :english
      end
      indexes :food_items do
        indexes :name, type: "text", analyzer: :english
      end
    end
  end

  def as_indexed_json(options = {})
    self.as_json(
      options.merge(only: [:restaurant_name],
        include: {
          restaurant_category: {only: :name},
          food_items: {only: :name},
        }
      )
    )
  end


  

end
