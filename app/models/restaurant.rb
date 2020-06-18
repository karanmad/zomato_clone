class Restaurant < ApplicationRecord
  validates :restaurant_name, :address, :phone_no, :email, presence: true
end
