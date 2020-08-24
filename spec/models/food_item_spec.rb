require 'rails_helper'

RSpec.describe FoodItem, type: :model do
  subject(:food_item) { FactoryBot.build(:food_item) }

  #validation
  describe ".food_item_name_presence" do
    context "food_item name is present" do
      it "food_item having a name is valid" do
        expect(subject).to be_valid
      end
    end
    context "food_item name is not present" do
      it "food_item having no name is invalid" do
        food_item.name = ""
        expect(subject).not_to be_valid
      end
    end
  end

  describe ".food_item_name_length" do
    context "with valid food_item name length" do
      it "food_item having name of length within 2 and 35 characters is valid" do
        expect(subject).to be_valid
      end
    end
    context "with invalid food_item name length" do
      it "food_item not having name of length within 2 and 35 characters is invalid" do
        subject.name = "k"
        expect(subject).not_to be_valid
      end 
    end
  end

  describe ".food_item_name_format" do
    context "with valid format of food_itemname" do
      it "food_item containg name with uppercase, lowercase letters and blank spaces is valid" do
        expect(subject).to be_valid
      end
    end
    context "with not valid format of food_itemname" do
      it "food_item containg name with digits and special characters is invalid" do
        subject.name = "karan123"
        expect(subject).not_to be_valid
      end
    end
  end

  describe ".food_item_price_presence" do
    context "food_item price is present" do
      it "food_item having a price is valid" do
        expect(subject).to be_valid
      end
    end
    context "food_item price is not present" do
      it "food_item having no price is invalid" do
        food_item.name = ""
        expect(subject).not_to be_valid
      end
    end
  end

  describe ".food_item_price_minimum_value" do
    context "with valid food_item price minimum value" do
      it "food_item having price greater than or equal to 1 is valid" do
        expect(subject).to be_valid
      end
    end
    context "with invalid food_item name length" do
      it "food_item having price less than 1 is invalid" do
        subject.name = 0
        expect(subject).not_to be_valid
      end 
    end
  end
  
  #association
  describe "has_many :cart_items" do
    it { is_expected.to have_many :cart_items }  
  end

  describe "belongs_to :restaurant" do
    it { is_expected.to belong_to :restaurant }  
  end
end
