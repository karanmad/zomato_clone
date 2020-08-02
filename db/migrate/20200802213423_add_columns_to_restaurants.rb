class AddColumnsToRestaurants < ActiveRecord::Migration[6.0]
  def change
    add_column :restaurants, :created_at, :datetime, precision: 6, null: false
    add_column :restaurants, :updated_at, :datetime, precision: 6, null: false
  end
end
