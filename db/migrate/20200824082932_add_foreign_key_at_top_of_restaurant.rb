class AddForeignKeyAtTopOfRestaurant < ActiveRecord::Migration[6.0]
  def change
    remove_reference :restaurants, :category, null: false, foreign_key: true
    remove_column :restaurants, :name, :string, null: false
    remove_column :restaurants, :address, :text, null: false
    remove_column :restaurants, :phone_no, :text, null: false, unique: true
    remove_column :restaurants, :email, :string, null: false, unique: true
    remove_attachment :restaurants, :image
    remove_column :restaurants, :table_price, :decimal, null: false
    remove_column :restaurants, :longitude, :float
    remove_column :restaurants, :latitude, :float
    remove_column :restaurants, :created_at, :datetime
    remove_column :restaurants, :updated_at, :datetime
    add_reference :restaurants, :category, null: false, foreign_key: true
    add_column :restaurants, :name, :string, null: false
    add_column :restaurants, :address, :text, null: false
    add_column :restaurants, :phone_no, :text, null: false, unique: true
    add_column :restaurants, :email, :string, null: false, unique: true
    add_column :restaurants, :table_price, :decimal, null: false
    add_column :restaurants, :longitude, :float
    add_column :restaurants, :latitude, :float
    add_attachment :restaurants, :image
    add_column :restaurants, :created_at, :datetime, precision: 6, null: false
    add_column :restaurants, :updated_at, :datetime, precision: 6, null: false
  end
end
