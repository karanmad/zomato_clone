FactoryBot.define do
  factory :cart do
    user_id { 1 }
    final { false }
    user { create(:user4) }
  end
end
