# frozen_string_literal: true

class RearrangColumnsOffoodItem < ActiveRecord::Migration[6.0]
  def change
    remove_reference :food_items, :restaurant, null: false, foreign_key: true
    remove_column :food_items, :name, :string, null: false, unique: true
    remove_column :food_items, :price, :decimal, null: false
    remove_column :food_items, :created_at, :datetime
    remove_column :food_items, :updated_at, :datetime
    add_reference :food_items, :restaurant, null: false, foreign_key: true
    add_column :food_items, :name, :string, null: false
    add_column :food_items, :price, :decimal, null: false
    add_column :food_items, :created_at, :datetime, precision: 6, null: false
    add_column :food_items, :updated_at, :datetime, precision: 6, null: false
    add_index :food_items, %i[name restaurant_id], unique: true
  end
end
