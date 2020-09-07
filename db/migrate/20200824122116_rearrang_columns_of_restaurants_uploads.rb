# frozen_string_literal: true

class RearrangColumnsOfRestaurantsUploads < ActiveRecord::Migration[6.0]
  def change
    remove_reference :restaurant_uploads, :review, null: false, foreign_key: true
    remove_attachment :restaurant_uploads, :image
    remove_column :restaurant_uploads, :created_at, :datetime
    remove_column :restaurant_uploads, :updated_at, :datetime
    add_reference :restaurant_uploads, :review, foreign_key: true
    add_attachment :restaurant_uploads, :image
    add_column :restaurant_uploads, :created_at, :datetime, precision: 6, null: false
    add_column :restaurant_uploads, :updated_at, :datetime, precision: 6, null: false
  end
end
