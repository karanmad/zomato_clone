FactoryBot.define do
  factory :restaurant do
    name { 'any store' }
    email { Faker::Internet.email }
    address { 'unknown address' }
    phone_no { Faker::PhoneNumber.phone_number }
    table_price { 500.0 }
    category
  end
end
