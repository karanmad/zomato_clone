# frozen_string_literal: true

FactoryBot.define do
  factory :cart, class: Cart do
    user
    final { false }
  end
end
