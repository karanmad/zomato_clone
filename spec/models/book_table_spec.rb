require 'rails_helper'

RSpec.describe BookTable, type: :model do
  subject(:book_table) { FactoryBot.build(:book_table) }
  let(:restaurant) { FactoryBot.create(:restaurant)} 

  #VALIDATION
  describe ".number_of_heads_presence" do
    context "number of heads is present" do
      it "book table having head is valid" do
        expect(subject).to be_valid
      end
    end
    context "number of heads is not present" do
      it "book table having no heads is invalid" do
        subject.heads = ""
        expect(subject).not_to be_valid
      end
    end
  end

  describe ".minimum_number_of_heads" do
    context "with valid number of heads" do
      it "book table having heads of within 1 and 20 is valid" do
        expect(subject).to be_valid
      end
    end
    context "with invalid number of heads" do
      it "book table having heads of outside 1 and 20 is invalid" do
        subject.heads = -1
        expect(subject).not_to be_valid
      end 
    end
  end

  describe ".book_table_time_presence" do
    context "time is present" do
      it "book table having time is valid" do
        expect(subject).to be_valid
      end
    end
    context "time is not present" do
      it "book table having no time is invalid" do
        subject.time = ""
        expect(subject).not_to be_valid
      end
    end
  end

  #association
  describe "belongs_to :user" do
    it { is_expected.to belong_to :user }  
  end

  describe "belongs_to :restaurant" do
    it { is_expected.to belong_to :restaurant }  
  end
  
  #model_method
  describe "#total" do
    it "should return book table total" do
      expect((restaurant.table_price)*subject.heads).to eq(subject.total)
    end
  end
    
  describe "#date_cannot_be_in_the_past" do
    it "date must not be in past" do
      subject.date = Date.today
      expect(subject).to be_valid
    end
    it "date in past" do
      subject.date = Date.yesterday
      expect(subject).not_to be_valid
    end
  end
end
