class Restaurant < ApplicationRecord
  validates :restaurant_name, :address, :phone_no, presence: true
end
