class AddColumnsToCarts < ActiveRecord::Migration[6.0]
  def change
    add_column :carts, :created_at, :datetime, precision: 6, null: false
    add_column :carts, :updated_at, :datetime, precision: 6, null: false
  end
end
