require 'rails_helper'

RSpec.describe Promotion, type: :model do
  subject(:promotion) { FactoryBot.build(:promotion) }
  let(:promotion1) { FactoryBot.create(:promotion, valid_date: Date.today) }

  #validation
  describe ".promotion_coupon_code_presence" do
    context "promotion coupon code is present" do
      it "promotion having a coupon_code is valid" do
        expect(subject).to be_valid
      end
    end
    context "promotion coupon_code is not present" do
      it "promotion having no coupon_code is invalid" do
        promotion.coupon_code = ""
        expect(subject).not_to be_valid
      end
    end
  end

  describe ".promotion_discount_presence" do
    context "promotion discount is present" do
      it "promotion having a discount is valid" do
        expect(subject).to be_valid
      end
    end
    context "promotion discount is not present" do
      it "promotion having no discount is invalid" do
        promotion.discount_percent = ""
        expect(subject).not_to be_valid
      end
    end
  end

  describe ".promotion_minimum_amount_presence" do
    context "promotion minimum amount is present" do
      it "promotion having a coupon_code is valid" do
        expect(subject).to be_valid
      end
    end
    context "promotion minimum amount is not present" do
      it "promotion having no minimum amount is invalid" do
        promotion.minimum_amount = ""
        expect(subject).not_to be_valid
      end
    end
  end

  #instance_method
  describe "#date_cannot_be_in_the_past" do
    it "date must not be in past" do
      subject.valid_date = Date.today
      expect(subject).to be_valid
    end
    it "date in past" do
      subject.valid_date = Date.yesterday
      expect(subject).not_to be_valid
    end
  end

  #class_method
  describe ".sort_by_params" do
    it "date must be in ascending order" do
      expect(Promotion.sort_by_params("1").first.valid_date).to eq(Promotion.minimum("valid_date"))
    end
    it "date must be in descending order" do
      expect(Promotion.sort_by_params("2").first.valid_date).to eq(Promotion.maximum("valid_date"))
    end
    it "discount percent must be in ascending order" do
      expect(Promotion.sort_by_params("3").first.discount_percent).to eq(Promotion.minimum("discount_percent"))
    end
    it "discount percent must be in descending order" do
      expect(Promotion.sort_by_params("4").first.discount_percent).to eq(Promotion.maximum("discount_percent"))
    end
    it "must contain all promotion" do
      expect(Promotion.sort_by_params(" ").first).to eq(Promotion.first) 
    end
  end

  describe ".filter_by_params" do
    it "promotion must be active" do
      expect(Promotion.filter_by_params("1")).to include(promotion1)
    end
    it "promotion must be expired" do
      expect(Promotion.filter_by_params("2")).not_to include(promotion1)
    end
    it "must contain all promotion" do
      expect(Promotion.filter_by_params(" ").first).to eq(Promotion.first) 
    end
  end
end
