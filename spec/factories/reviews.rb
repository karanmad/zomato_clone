FactoryBot.define do
  factory :review, class: Review do
    rating { 4 }
    feedback { "something" }
    restaurant
    user
    approve { true }
  end
end
