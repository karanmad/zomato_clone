# frozen_string_literal: true

class RemoveColumnsFromCarts < ActiveRecord::Migration[6.0]
  def change
    remove_column :carts, :created_at, :datetime
    remove_column :carts, :updated_at, :datetime
  end
end
