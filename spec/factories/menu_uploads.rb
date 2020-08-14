FactoryBot.define do
  factory :menu_upload do
    restaurant_id { 1 }
    restaurant { create(:restaurant) }
  end
end
