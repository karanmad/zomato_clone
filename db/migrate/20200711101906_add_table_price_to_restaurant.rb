class AddTablePriceToRestaurant < ActiveRecord::Migration[6.0]
  def change
    add_column :restaurants, :table_price, :decimal, null: false
  end
end
