# frozen_string_literal: true

FactoryBot.define do
  factory :food_item, class: FoodItem do
    name { 'fooditem' }
    price { 100.45 }
    restaurant
  end
end
