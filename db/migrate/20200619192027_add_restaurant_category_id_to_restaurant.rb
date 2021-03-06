# frozen_string_literal: true

class AddRestaurantCategoryIdToRestaurant < ActiveRecord::Migration[6.0]
  def change
    add_reference :restaurants, :category, null: false, foreign_key: true
  end
end
