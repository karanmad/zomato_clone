# frozen_string_literal: true

class AddAttachmentImageToFoodUploads < ActiveRecord::Migration[6.0]
  def self.up
    change_table :food_uploads do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :food_uploads, :image
  end
end
