FactoryBot.define do
  factory :category, class: Category do
    name { Faker::Science.element }
  end

  factory :category2, class: Category do
    name { "something" }
  end
end
