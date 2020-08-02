class AddColumnsToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :created_at, :datetime, precision: 6, null: false
    add_column :orders, :updated_at, :datetime, precision: 6, null: false
  end
end
