FactoryBot.define do
  factory :menu_upload do
    restaurant_id { create(:restaurant).id }
  end
end
