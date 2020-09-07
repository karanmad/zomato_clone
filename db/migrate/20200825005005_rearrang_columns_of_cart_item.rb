# frozen_string_literal: true

class RearrangColumnsOfCartItem < ActiveRecord::Migration[6.0]
  def change
    remove_reference :cart_items, :cart, null: false, foreign_key: true
    remove_reference :cart_items, :food_item, null: false, foreign_key: true
    remove_column :cart_items, :quantity, :integer
    remove_column :cart_items, :created_at, :datetime
    remove_column :cart_items, :updated_at, :datetime
    add_reference :cart_items, :cart, null: false, foreign_key: true
    add_reference :cart_items, :food_item, null: false, foreign_key: true
    add_column :cart_items, :quantity, :integer, default: 1
    add_column :cart_items, :created_at, :datetime, precision: 6, null: false
    add_column :cart_items, :updated_at, :datetime, precision: 6, null: false
  end
end
