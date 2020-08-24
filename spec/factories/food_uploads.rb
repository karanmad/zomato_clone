FactoryBot.define do
  factory :food_upload do
    restaurant_id { create(:restaurant).id }
  end
end
