# frozen_string_literal: true

class RemoveSubtotalFromCartItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :cart_items, :subtotal, :decimal
  end
end
