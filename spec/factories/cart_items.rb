FactoryBot.define do
  factory :cart_item, class: CartItem do
    quantity { 1 }
    cart_id { create(:cart).id }
    food_item_id { create(:food_item).id }
  end
end
