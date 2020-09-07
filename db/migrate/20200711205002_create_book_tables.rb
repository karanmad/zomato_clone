# frozen_string_literal: true

class CreateBookTables < ActiveRecord::Migration[6.0]
  def change
    create_table :book_tables do |t|
      t.date :date, null: false
      t.time :time, null: false
      t.integer :heads, null: false
      t.references :user, null: false, foreign_key: true
      t.references :restaurant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
