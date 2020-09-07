# frozen_string_literal: true

class MenuUpload < ApplicationRecord
  belongs_to :restaurant
  belongs_to :review, optional: true

  has_attached_file :image
  validates_attachment_content_type :image, content_type: %r{\Aimage/.*\z}
end
