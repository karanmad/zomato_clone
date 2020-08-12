class RenameRestaurantNameColumnToName < ActiveRecord::Migration[6.0]
  def change
    rename_column :restaurants, :restaurant_name, :name
  end
end
