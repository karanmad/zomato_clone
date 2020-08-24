require 'rails_helper'

RSpec.describe CartItem, type: :model do
  let(:food_item) { FactoryBot.create(:food_item) }
  subject(:cart_item) { FactoryBot.create(:cart_item) }  
  
  #validation
  describe ".quantity_presence" do
    context "quantity is present" do 
      it "ensures item is valid" do 
        expect(cart_item).to be_valid
      end
    end

    context "quantity is not present" do 
      it "ensures item is invalid" do 
        cart_item.quantity = 0
        expect(cart_item).not_to be_valid
      end
    end
  end

  #association
  describe "model association test" do
    it { is_expected.to belong_to :cart }
    it { is_expected.to belong_to :food_item }
  end

  #instance_method
  describe "#subtotal" do 
    it "should return subtotal" do
      expect(cart_item.subtotal).to eq(food_item.price*cart_item.quantity)
    end
  end
end
