FactoryBot.define do
  factory :category, class: Category do
    name { "anything" }
  end

  factory :category2, class: Category do
    name { "something" }
  end
end
