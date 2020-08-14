require 'rails_helper'

RSpec.describe Category, type: :model do
  subject(:category) { FactoryBot.build(:category) }

  #validation_test
  describe ".category_name_presence" do
    context "category name is present" do
      it "category having a name is valid" do
        expect(subject).to be_valid
      end
    end
    context "category name is not present" do
      it "category having no name is invalid" do
        subject.name = ""
        expect(subject).not_to be_valid
      end
    end
  end

  describe ".category_name_length" do
    context "with valid category name length" do
      it "category having name of length within 2 and 35 characters is valid" do
        expect(subject).to be_valid
      end
    end
    context "with invalid category name length" do
      it "category not having name of length within 2 and 35 characters is invalid" do
        subject.name = "k"
        expect(subject).not_to be_valid
      end 
    end
  end

  describe ".category_name_format" do
    context "with valid format of categoryname" do
      it "category containg name with uppercase, lowercase letters and blank spaces is valid" do
        expect(subject).to be_valid
      end
    end
    context "with not valid format of categoryname" do
      it "category containg name with digits and special characters is invalid" do
        subject.name = "karan123"
        expect(subject).not_to be_valid
      end
    end
  end

  #association_test
  describe "has_many :restaurants" do
    it { is_expected.to have_many :restaurants }  
  end
  
end
