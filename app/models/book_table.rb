# frozen_string_literal: true

class BookTable < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant

  validates :heads, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 20 }
  validates :time, presence: true
  validates :date, presence: true
  validate :date_cannot_be_in_the_past

  def date_cannot_be_in_the_past
    errors.add(:date, "can't be in the past") if date < Date.today
  end

  def total
    restaurant.table_price * heads
  end
end
