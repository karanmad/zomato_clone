require 'rails_helper'

RSpec.describe Cart, type: :model do
  subject(:cart) { FactoryBot.build(:cart) }
  let(:food_item) { FactoryBot.create(:food_item) }
  let(:cart_item) { FactoryBot.create(:cart_item) }
  let(:item) { FactoryBot.create(:item) }
  
  #association
  describe "has_many :cart_items" do
    it { is_expected.to have_many :cart_items }  
  end

  describe "has_one :order" do
    it { is_expected.to have_one :order }  
  end

  describe "belongs_to :user" do
    it { is_expected.to belong_to :user }  
  end
  #instance_method
  describe "#total_instance_method" do
    it "should return cart total" do
      expect(cart_item.subtotal + item.subtotal).to eq(cart.total)
    end
  end

end
