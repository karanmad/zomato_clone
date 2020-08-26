FactoryBot.define do
  factory :promotion do
    coupon_code { "MyText" }
    valid_date { "2020-08-26" }
    minimum_amount { "9.99" }
    discount_percent { "9.99" }
  end
end
