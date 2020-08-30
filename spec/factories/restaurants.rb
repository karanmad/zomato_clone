FactoryBot.define do
  factory :restaurant do
    name { "any store" }
    email { Faker::Internet.email }
    address { "unknown address" }
    phone_no { Faker::PhoneNumber.phone_number }
    table_price { 500.0 }
    category_id { create(:category).id } 
  end
end
