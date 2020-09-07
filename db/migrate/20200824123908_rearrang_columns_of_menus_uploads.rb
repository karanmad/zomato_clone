# frozen_string_literal: true

class RearrangColumnsOfMenusUploads < ActiveRecord::Migration[6.0]
  def change
    remove_reference :menu_uploads, :review, null: false, foreign_key: true
    remove_attachment :menu_uploads, :image
    remove_column :menu_uploads, :created_at, :datetime
    remove_column :menu_uploads, :updated_at, :datetime
    add_reference :menu_uploads, :review, foreign_key: true
    add_attachment :menu_uploads, :image
    add_column :menu_uploads, :created_at, :datetime, precision: 6, null: false
    add_column :menu_uploads, :updated_at, :datetime, precision: 6, null: false
  end
end
