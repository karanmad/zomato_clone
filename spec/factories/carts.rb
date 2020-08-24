FactoryBot.define do
  factory :cart, class: Cart do
    user_id { create(:user).id }
    final { false }
  end
end
