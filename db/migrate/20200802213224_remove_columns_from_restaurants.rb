class RemoveColumnsFromRestaurants < ActiveRecord::Migration[6.0]
  def change
    remove_column :restaurants, :created_at, :datetime
    remove_column :restaurants, :updated_at, :datetime
  end
end
