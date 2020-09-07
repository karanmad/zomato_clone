# frozen_string_literal: true

class CreateFoodUploads < ActiveRecord::Migration[6.0]
  def change
    create_table :food_uploads do |t|
      t.references :restaurant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
