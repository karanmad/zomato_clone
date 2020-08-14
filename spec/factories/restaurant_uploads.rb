FactoryBot.define do
  factory :restaurant_upload do
    restaurant_id { 1 }
    restaurant { create(:restaurant) }
  end
end
