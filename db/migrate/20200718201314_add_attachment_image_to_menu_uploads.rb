# frozen_string_literal: true

class AddAttachmentImageToMenuUploads < ActiveRecord::Migration[6.0]
  def self.up
    change_table :menu_uploads do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :menu_uploads, :image
  end
end
