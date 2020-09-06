require 'rails_helper'

RSpec.describe Review, type: :model do
  subject(:review) { FactoryBot.create(:review) }

  #validation
  describe ".review_rating_presence" do
    context "review rating is present" do
      it "review having rating is valid" do
        expect(subject).to be_valid
      end
    end
    context "review rating is not present" do
      it "review not having rating is invalid" do
        subject.rating = ""
        expect(subject).not_to be_valid
      end
    end
  end

  describe ".review_rating_value" do
    context "review rating with valid value" do
      it "review having rating within 1 to 5  is valid" do
        expect(subject).to be_valid
      end
    end
    context "review rating with not valid length" do
      it "review not having rating within 1 to 5 is not valid" do
        subject.rating = 6
        expect(subject).not_to be_valid
      end
    end
  end

  describe ".review_feedback_presence" do
    context "review feedback is present" do
      it "review having feedback is valid" do
        expect(subject).to be_valid
      end
    end
    context "review feedback is not present" do
      it "review not having feedback is invalid" do
        subject.feedback = ""
        expect(subject).not_to be_valid
      end
    end
  end

  describe ".review_feedback_length" do
    context "review feedback with valid length" do
      it "review having feedback within 2 to 200 characters is valid" do
        expect(subject).to be_valid
      end
    end
    context "review feedback with not valid length" do
      it "review not having feedback within 2 to 200 characters is not valid" do
        subject.feedback = "r"
        expect(subject).not_to be_valid
      end
    end
  end

  #association
  describe "has_many :food_uploads" do
    it { is_expected.to have_many :food_uploads }  
  end

  describe "has_many :menu_uploads" do
    it { is_expected.to have_many :menu_uploads }  
  end

  describe "has_many :restaurant_uploads" do
    it { is_expected.to have_many :restaurant_uploads }  
  end

  describe "belongs_to :user" do
    it { is_expected.to belong_to :user }  
  end

  describe "belongs_to :restaurant" do
    it { is_expected.to belong_to :restaurant }  
  end

  #instance_method
  describe "#approve_review" do
    it "review is not approved" do
      review.approve_review
      expect(review.approve).to eq(true)
    end
  end

  describe "#unset_review" do
    it "review is not approved" do
      review.unset_review
      expect(review.approve).to eq(false)
    end
  end
end
