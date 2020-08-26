class Promotion < ApplicationRecord
  validates :coupon_code, :valid_date, :minimum_amount, :discount_percent, presence: true
  validate :date_cannot_be_in_the_past

  def date_cannot_be_in_the_past
    if valid_date < Date.today
      errors.add(:date, "can't be in the past")
    end
  end 

end
