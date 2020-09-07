# frozen_string_literal: true

FactoryBot.define do
  factory :order do
    address { 'unknown address' }
    cart
  end
end
