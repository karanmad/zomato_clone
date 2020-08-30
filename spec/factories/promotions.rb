FactoryBot.define do
  factory :promotion do
    coupon_code { Faker::Name.name }
    discount_percent { 5 }
    minimum_amount { 300 }
    valid_date { rand(1..100).days.from_now }
  end
end
