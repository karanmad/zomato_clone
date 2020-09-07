# frozen_string_literal: true

class AddReviewToFoodUpload < ActiveRecord::Migration[6.0]
  def change
    add_reference :food_uploads, :review, null: true, foreign_key: true
  end
end
