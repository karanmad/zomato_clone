FactoryBot.define do
  factory :cart_item do
    quantity { 1 }
    cart_id { 1 }
    food_item_id { 1 }
    cart{ create(:cart) }
    food_item{ create(:food_item) }
  end

  factory :item do
    quantity { 1 }
    cart_id { 1 }
    food_item_id { 1 }
    cart{ create(:cart) }
    food_item{ create(:food_item_2) }
  end
  
end
