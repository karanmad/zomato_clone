FactoryBot.define do
  factory :restaurant_upload do
    restaurant_id { create(:restaurant).id }
  end
end
