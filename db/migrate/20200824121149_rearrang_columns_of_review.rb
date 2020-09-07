# frozen_string_literal: true

class RearrangColumnsOfReview < ActiveRecord::Migration[6.0]
  def change
    remove_column :reviews, :rating, :integer, null: false
    remove_column :reviews, :feedback, :text, null: false
    remove_reference :reviews, :user, null: false, foreign_key: true
    remove_reference :reviews, :restaurant, null: false, foreign_key: true
    remove_column :reviews, :approve, :boolean
    remove_column :reviews, :created_at, :datetime
    remove_column :reviews, :updated_at, :datetime
    add_reference :reviews, :restaurant, null: false, foreign_key: true
    add_reference :reviews, :user, null: false, foreign_key: true
    add_column :reviews, :rating, :integer, null: false
    add_column :reviews, :feedback, :text, null: false
    add_column :reviews, :approve, :boolean, default: false
    add_column :reviews, :created_at, :datetime, precision: 6, null: false
    add_column :reviews, :updated_at, :datetime, precision: 6, null: false
  end
end
