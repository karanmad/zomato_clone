FactoryBot.define do
  factory :user, class: User do
    name { "person" }
    email   { "person@gmail.com" }
    password { "123456" }
  end

  factory :user2, class: User do
    name { "person" }
    email   { "person2@gmail.com" }
    password { "123456" }
  end

  factory :user3, class: User do
    name { "karan" }
    email   { "karan123254513@gmail.com" }
    password { "123456" }
  end

  factory :user4, class: User do
    name { "karanss" }
    email   { "asdf3@gmail.com" }
    password { "123456" }
  end



  factory :admin, class: User do
    name { "person" }
    email   { "person4@gmail.com" }
    password { "123456" }
    admin { true }
  end
end
