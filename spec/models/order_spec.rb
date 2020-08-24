require 'rails_helper'

RSpec.describe Order, type: :model do
  subject(:order) { FactoryBot.build(:order) }
  
  #validation
  describe ".delivery_address_presence" do
    context "delivery address is present" do
      it "having address is valid" do
        expect(subject).to be_valid
      end
    end
    context "delivery address is not present" do
      it "not having address is invalid" do
        subject.address = ""
        expect(subject).not_to be_valid
      end
    end
  end

  describe ".delivery_address_length" do
    context "delivery address with valid length" do
      it "having address within 5 to 200 characters is valid" do
        expect(subject).to be_valid
      end
    end
    context "delivery address with not valid length" do
      it "not having address within 5 to 200 characters is not valid" do
        subject.address = "adr"
        expect(subject).not_to be_valid
      end
    end
  end

  #association
  describe "belongs_to :cart" do
    it { is_expected.to belong_to :cart }  
  end
end
