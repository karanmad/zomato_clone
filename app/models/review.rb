class Review < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
  has_many :restaurant_uploads, dependent: :destroy
  has_many :food_uploads, dependent: :destroy
  has_many :menu_uploads, dependent: :destroy
  validates :feedback, presence: true, length: {maximum: 200, minimum: 2}
  validates :rating, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5}

  def files=(array_of_files = [])
    array_of_files.each do |f|
      restaurant_uploads.build(image: f, review: self, restaurant: restaurant)
    end
  end
                                                                               
  def pictures=(array_of_pictures = [])
    array_of_pictures.each do |f|
      food_uploads.build(image: f, review: self, restaurant: restaurant)
    end
  end

  def photos=(array_of_photos = [])
    array_of_photos.each do |f|
      menu_uploads.build(image: f, review: self, restaurant: restaurant)
    end
  end
end
