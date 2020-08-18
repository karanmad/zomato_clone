FactoryBot.define do
  factory :food_item, class: FoodItem do
    name { "fooditem" }
    price { 100.45 }
    restaurant_id { 1 }
    restaurant { create(:restaurant) }
  end

  factory :food_item_2, class: FoodItem do
    name { "fooditemas" }
    price { 100.45 }
    restaurant_id { 1 }
    restaurant { create(:restaurant) }
  end
end
