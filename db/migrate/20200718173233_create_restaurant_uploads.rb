class CreateRestaurantUploads < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurant_uploads do |t|
      t.references :restaurant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
