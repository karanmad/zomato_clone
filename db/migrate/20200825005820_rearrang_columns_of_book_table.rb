# frozen_string_literal: true

class RearrangColumnsOfBookTable < ActiveRecord::Migration[6.0]
  def change
    remove_reference :book_tables, :user, null: false, foreign_key: true
    remove_reference :book_tables, :restaurant, null: false, foreign_key: true
    remove_column :book_tables, :heads
    remove_column :book_tables, :date
    remove_column :book_tables, :time
    remove_column :book_tables, :created_at, :datetime
    remove_column :book_tables, :updated_at, :datetime
    add_reference :book_tables, :user, null: false, foreign_key: true
    add_reference :book_tables, :restaurant, null: false, foreign_key: true
    add_column :book_tables, :heads, :integer, null: false
    add_column :book_tables, :date, :date, null: false
    add_column :book_tables, :time, :time, null: false
    add_column :book_tables, :created_at, :datetime, precision: 6, null: false
    add_column :book_tables, :updated_at, :datetime, precision: 6, null: false
  end
end
