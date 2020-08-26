class CreatePromotions < ActiveRecord::Migration[6.0]
  def change
    create_table :promotions do |t|
      t.text :coupon_code
      t.date :valid_date
      t.decimal :minimum_amount
      t.decimal :discount_percent

      t.timestamps
    end
  end
end
