class RemoveColumnsFromRestaurantUploads < ActiveRecord::Migration[6.0]
  def change
    remove_column :restaurant_uploads, :created_at, :datetime
    remove_column :restaurant_uploads, :updated_at, :datetime
  end
end
