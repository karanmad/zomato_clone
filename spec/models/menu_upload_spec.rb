require 'rails_helper'

RSpec.describe MenuUpload, type: :model do
  subject(:menu_upload) { FactoryBot.build(:menu_upload) }

  #association
  describe "belongs_to :restaurant" do
    it { is_expected.to belong_to :restaurant }  
  end

  describe "belongs_to :review" do
    it { is_expected.to belong_to(:review).optional }  
  end
end
