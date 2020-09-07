# frozen_string_literal: true

class AddAttachmentImageToRestaurants < ActiveRecord::Migration[6.0]
  def self.up
    change_table :restaurants do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :restaurants, :image
  end
end
