# frozen_string_literal: true

class CreateFoodItems < ActiveRecord::Migration[6.0]
  def change
    create_table :food_items do |t|
      t.string :name, null: false
      t.decimal :price, null: false
      t.references :restaurant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
