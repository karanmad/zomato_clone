# frozen_string_literal: true

class AddAttachmentImageToRestaurantUploads < ActiveRecord::Migration[6.0]
  def self.up
    change_table :restaurant_uploads do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :restaurant_uploads, :image
  end
end
