class RearrangColumnsOfFoodUploads < ActiveRecord::Migration[6.0]
  def change
    remove_reference :food_uploads, :review, null: false, foreign_key: true
    remove_attachment :food_uploads, :image
    remove_column :food_uploads, :created_at, :datetime
    remove_column :food_uploads, :updated_at, :datetime
    add_reference :food_uploads, :review, null: false, foreign_key: true
    add_attachment :food_uploads, :image
    add_column :food_uploads, :created_at, :datetime, precision: 6, null: false
    add_column :food_uploads, :updated_at, :datetime, precision: 6, null: false
  end
end
