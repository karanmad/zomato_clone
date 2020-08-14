FactoryBot.define do
  factory :food_upload do
    restaurant_id { 1 }
    restaurant { create(:restaurant) }
  end
end
