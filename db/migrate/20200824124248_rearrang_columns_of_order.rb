class RearrangColumnsOfOrder < ActiveRecord::Migration[6.0]
  def change
    remove_column :orders, :address, :text, null: false
    remove_reference :orders, :cart, null: false, foreign_key: true
    remove_column :orders, :created_at, :datetime
    remove_column :orders, :updated_at, :datetime
    add_reference :orders, :cart, null: false, foreign_key: true
    add_column :orders, :address, :text, null: false
    add_column :orders, :created_at, :datetime, precision: 6, null: false
    add_column :orders, :updated_at, :datetime, precision: 6, null: false
  end
end
