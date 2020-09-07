require 'rails_helper'

RSpec.describe FoodUpload, type: :model do
  subject(:food_upload) { FactoryBot.build(:food_upload) }

  # association
  describe 'belongs_to :restaurant' do
    it { is_expected.to belong_to :restaurant }
  end

  describe 'belongs_to :review' do
    it { is_expected.to belong_to(:review).optional }
  end
end
