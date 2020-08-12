class Restaurant < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  VALID_PHONE_REGEX = /\A[6-9][0-9]{9}\z/
  VALID_NAME_REGEX = /\A[\sA-Za-z]*\z/i
  VALID_EMAIL_REGEX = 	/\A[^@\s]+@([^@.\s]+\.)*[^@.\s]+\z/

  geocoded_by :address

  after_validation :geocode
  after_save :reindex

  belongs_to :category
  has_many :food_items, dependent: :destroy
  has_many :book_tables
  has_many :reviews, dependent: :destroy
  has_many :restaurant_uploads, dependent: :destroy
  has_many :food_uploads, dependent: :destroy
  has_many :menu_uploads, dependent: :destroy

  validates :address, presence: true, length: { maximum: 200, minimum: 5}
  validates :phone_no, presence: true, format: { with: VALID_PHONE_REGEX }
  validates :table_price, presence: true,  numericality: { greater_than_or_equal_to: 1 }
  validates :name, presence: true, format: { with:  VALID_NAME_REGEX }, length: { maximum: 50, minimum: 2}
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { :case_sensitive => false}
  
  
  has_attached_file :image
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  
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
      indexes :address, type: :text, analyzer: :english
      indexes :category do
        indexes :name, type: "text", analyzer: :english
      end
      indexes :food_items do
        indexes :name, type: "text", analyzer: :english
      end
    end
  end

  def as_indexed_json(options = {})
    self.as_json(
      options.merge(only: [:restaurant_name, :address],
        include: {
          category: {only: :name},
          food_items: {only: :name},
        }
      )
    )
  end

  def reindex
   __elasticsearch__.index_document
  end
  
  def rating
    sum = reviews.where(approve: true).all.each.collect {|review| review.valid? ? review.rating : 0 }.sum
    if sum > 0
      return (sum/Float(reviews.where(approve: true).count)).round(1)
    else
      return 0
    end
  end

end
