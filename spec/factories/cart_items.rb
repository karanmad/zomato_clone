# frozen_string_literal: true

FactoryBot.define do
  factory :cart_item, class: CartItem do
    quantity { 1 }
    cart
    food_item
  end
end
