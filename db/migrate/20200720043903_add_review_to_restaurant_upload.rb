class AddReviewToRestaurantUpload < ActiveRecord::Migration[6.0]
  def change
    add_reference :restaurant_uploads, :review, null: true, foreign_key: true
  end
end
