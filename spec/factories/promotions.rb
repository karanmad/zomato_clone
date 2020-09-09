FactoryBot.define do
  factory :promotion do
    coupon_code { Faker::Name.name }
    discount_percent { rand(1..100) }
    minimum_amount { rand(1..100) }
    valid_date { rand(1..100).days.from_now }
  end
end
