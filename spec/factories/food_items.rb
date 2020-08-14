FactoryBot.define do
  factory :food_item do
    name { "fooditem" }
    price { 100 }
    restaurant_id { 1 }
    restaurant { create(:restaurant) }
  end

  factory :food_item_2 do
    name { "fooditemas" }
    price { 10 }
    restaurant_id { 1 }
    restaurant { create(:restaurant) }
  end
end
