require 'rails_helper'

RSpec.describe RestaurantUpload, type: :model do
  subject(:restaurant_upload) { FactoryBot.build(:restaurant_upload) }

  #association
  describe 'belongs_to :restaurant' do
    it { is_expected.to belong_to :restaurant }  
  end

  describe 'belongs_to :review' do
    it { is_expected.to belong_to(:review).optional }  
  end
end
