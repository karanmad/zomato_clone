FactoryBot.define do
  factory :category, class: Category do
    name { Faker::Science.element }
  end
end
