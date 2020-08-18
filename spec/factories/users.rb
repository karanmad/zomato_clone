FactoryBot.define do
  factory :user, class: User do
    name { "person" }
    email   { Faker::Internet.email }
    password { "123456" }
  end

  factory :user2, class: User do
    name { "person" }
    email   { Faker::Internet.email }
    password { "123456" }
  end

  factory :user3, class: User do
    name { "karan" }
    email   { Faker::Internet.email }
    password { "123456" }
  end

  factory :user4, class: User do
    name { "karanss" }
    email   { Faker::Internet.email }
    password { "123456" }
  end

  factory :admin, class: User do
    name { "person" }
    email   { Faker::Internet.email }
    password { "123456" }
    admin { true }
  end
end
