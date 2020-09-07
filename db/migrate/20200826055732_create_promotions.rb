# frozen_string_literal: true

class CreatePromotions < ActiveRecord::Migration[6.0]
  def change
    create_table :promotions do |t|
      t.text :coupon_code, null: false
      t.date :valid_date, null: false
      t.decimal :minimum_amount, null: false
      t.decimal :discount_percent, null: false

      t.timestamps
      t.index :coupon_code, unique: true
    end
  end
end
