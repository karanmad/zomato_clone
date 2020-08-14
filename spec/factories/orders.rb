FactoryBot.define do
  factory :order do
    address { "unknown address" }
    cart_id { 1 }
    cart { create(:cart) }
  end
end
