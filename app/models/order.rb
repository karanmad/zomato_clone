class Order < ApplicationRecord
  belongs_to :cart
  validates :address, presence: true
  
end
