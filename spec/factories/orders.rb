FactoryBot.define do
  factory :order do
    address { "unknown address" }
    cart_id { create(:cart).id }
  end
end
