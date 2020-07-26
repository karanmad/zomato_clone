class AddApproveToReview < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :approve, :boolean, default: false
  end
end
