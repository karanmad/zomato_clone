class Promotion < ApplicationRecord
  validates :coupon_code, :valid_date, :minimum_amount, :discount_percent, presence: true
  validates_uniqueness_of :coupon_code
  validates :minimum_amount, numericality: { greater_than_or_equal_to: 1 }
  validates :discount_percent, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 100 }
  validate :date_cannot_be_in_the_past

  def date_cannot_be_in_the_past
    if valid_date < Date.today
      errors.add(:date, "can't be in the past")
    end
  end 
end
