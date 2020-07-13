class CreateBookTables < ActiveRecord::Migration[6.0]
  def change
    create_table :book_tables do |t|
      t.date :date
      t.time :time
      t.integer :heads
      t.references :user, null: false, foreign_key: true
      t.references :restaurant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
