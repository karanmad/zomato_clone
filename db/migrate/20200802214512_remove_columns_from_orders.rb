class RemoveColumnsFromOrders < ActiveRecord::Migration[6.0]
  def change
    remove_column :orders, :created_at, :datetime
    remove_column :orders, :updated_at, :datetime
  end
end
