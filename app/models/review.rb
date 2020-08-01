class Review < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
  validates :feedback, :rating, presence: true
  validates :rating, numericality: { only_integer: true}
  has_many :restaurant_uploads, dependent: :destroy
  has_many :food_uploads, dependent: :destroy
  has_many :menu_uploads, dependent: :destroy
 
  def files=(array_of_files = [])
    array_of_files.each do |f|
      restaurant_uploads.create(image: f, review: self, restaurant: restaurant)
    end
  end
                                                                               
  def pictures=(array_of_pictures = [])
    array_of_pictures.each do |f|
      food_uploads.create(image: f, review: self, restaurant: restaurant)
    end
  end

  def photos=(array_of_photos = [])
    array_of_photos.each do |f|
      menu_uploads.create(image: f, review: self, restaurant: restaurant)
    end
  end

end
