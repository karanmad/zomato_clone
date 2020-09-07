# frozen_string_literal: true

class AddReviewToMenuUpload < ActiveRecord::Migration[6.0]
  def change
    add_reference :menu_uploads, :review, null: true, foreign_key: true
  end
end
