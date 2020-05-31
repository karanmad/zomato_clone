class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.string :restaurant_name
      t.text :address
      t.text :phone_no

      t.timestamps
    end
  end
end
