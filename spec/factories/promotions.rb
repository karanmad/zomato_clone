FactoryBot.define do
  factory :promotion do
    coupon_code { Faker::Name.name }
    discount_percent { Base::Numbers.positive( from = 1, to = 100) }
    minimum_amount { Base::Numbers.positive( from = 1, to = 100) }
    valid_date { rand(1..100).days.from_now }
  end
end
