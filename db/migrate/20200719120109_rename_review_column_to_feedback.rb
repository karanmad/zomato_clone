# frozen_string_literal: true

class RenameReviewColumnToFeedback < ActiveRecord::Migration[6.0]
  def change
    rename_column :reviews, :review, :feedback
  end
end
