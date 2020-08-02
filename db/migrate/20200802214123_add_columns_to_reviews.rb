class AddColumnsToReviews < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :created_at, :datetime, precision: 6, null: false
    add_column :reviews, :updated_at, :datetime, precision: 6, null: false
  end
end
