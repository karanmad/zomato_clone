FactoryBot.define do
  factory :review, class: Review do
    rating { 4 }
    feedback { "something" }
    restaurant_id { create(:restaurant).id }
    user_id { create(:user).id }
    approve { true }
  end
end
