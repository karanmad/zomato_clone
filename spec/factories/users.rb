FactoryBot.define do
  factory :user, class: User do
    name { 'person' }
    email { Faker::Internet.email }
    password { '123456' }
  end
end
