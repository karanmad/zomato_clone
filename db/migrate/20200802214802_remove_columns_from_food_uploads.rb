class RemoveColumnsFromFoodUploads < ActiveRecord::Migration[6.0]
  def change
    remove_column :food_uploads, :created_at, :datetime
    remove_column :food_uploads, :updated_at, :datetime
  end
end
