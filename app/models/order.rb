# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :cart

  validates :address, presence: true, length: { maximum: 200, minimum: 5 }
end
