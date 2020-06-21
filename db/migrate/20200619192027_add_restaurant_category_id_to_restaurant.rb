class AddRestaurantCategoryIdToRestaurant < ActiveRecord::Migration[6.0]
  def change
    add_column :restaurants, :restaurant_category_id, :integer
  end
end
