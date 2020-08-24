require 'rails_helper'

RSpec.describe Restaurant, type: :model do
   subject(:restaurant) { FactoryBot.create(:restaurant) }
   let(:review)  { FactoryBot.create(:review, restaurant_id: restaurant.id, ) }

  #validation 
  describe ".restaurant_name_presence" do
    context "restaurant name is present" do
      it "restaurant having a name is valid" do
        expect(subject).to be_valid
      end
    end
    context "restaurant name is not present" do
      it "restaurant having no name is invalid" do
        restaurant.name = ""
        expect(subject).not_to be_valid
      end
    end
  end

  describe ".restaurant_name_length" do
    context "with valid restaurant name length" do
      it "restaurant having name of length within 2 and 50 characters is valid" do
        expect(subject).to be_valid
      end
    end
    context "with invalid restaurant name length" do
      it "restaurant not having name of length within 2 and 50 characters is invalid" do
        subject.name = "k"
        expect(subject).not_to be_valid
      end 
    end
  end

  describe ".restaurant_name_format" do
    context "with valid format of restaurantname" do
      it "restaurant containg name with uppercase, lowercase letters and blank spaces is valid" do
        expect(subject).to be_valid
      end
    end
    context "with not valid format of restaurantname" do
      it "restaurant containg name with digits and special characters is invalid" do
        subject.name = "karan123"
        expect(subject).not_to be_valid
      end
    end
  end

  describe ".restaurant_email_presence" do
    context "when restaurant email present" do
      it "restaurant having an email is valid" do
        expect(subject).to be_valid
      end
    end
    context "when restaurant email not present" do
      it "restaurant having no email is invalid" do
        subject.email = ""
        expect(subject).not_to be_valid
      end
    end
  end

  describe ".restaurant_email_length" do
    context "with valid restaurant email length" do
      it "restaurant having email of length within 8 and 80 characters is valid" do
        expect(subject).to be_valid
      end
    end
    context "with invalid restaurant email length" do
      it "restaurant not having email of length within 8 and 80 characters is invalid" do
        subject.email = "a@b.in"
        expect(subject).not_to be_valid
      end
    end
  end
  
  describe ".restaurant_email_uniqueness" do
    let(:restaurant_duplicate) { Restaurant.new(name: "person", email: "personx@gmail.com", address: "some unkown address", phone_no: "9852123456", table_price: 560.6, category_id: 1 ) }
    context "with unique restaurant email" do
      it "restaurant having unique email is valid" do
        expect(restaurant_duplicate.email).not_to eq(subject.email)
      end
    end
     context "with non-unique restaurant email" do
      it "restaurant not having unique email is invalid" do
        subject.email = "personx@gmail.com"
        expect(restaurant_duplicate.email).to eq(subject.email)
      end
    end
  end

  describe ".restaurant_email_format" do
    context "with valid restaurant email format" do
      it "restaurant containing email with the format __@__.__is valid" do
        expect(subject).to be_valid
      end
    end
    context "with invalid restaurant email format" do
      it "restaurant not containing email with the format __@__.__ is invalid" do
        subject.email = "person.com"
        expect(subject).not_to be_valid
      end
    end
  end

  describe ".restaurant_address_presence" do
    context "restaurant address is present" do
      it "restaurant having address is valid" do
        expect(subject).to be_valid
      end
    end
    context "restaurant address is not present" do
      it "restaurant not having address is invalid" do
        subject.address = ""
        expect(subject).not_to be_valid
      end
    end
  end

  describe ".restaurant_address_length" do
    context "restaurant address with valid length" do
      it "restaurant having address within 5 to 200 characters is valid" do
        expect(subject).to be_valid
      end
    end
    context "restaurant address with not valid length" do
      it "restaurant not having address within 5 to 200 characters is not valid" do
        subject.address = "adr"
        expect(subject).not_to be_valid
      end
    end
  end

  describe ".restaurant_phone_no_presence" do
    context "restaurant phone no is present" do
      it "restaurant having address is valid" do
        expect(subject).to be_valid
      end
    end
    context "restaurant phone no is not present" do
      it "restaurant not having phone no is invalid" do
        subject.address = ""
        expect(subject).not_to be_valid
      end
    end
  end

  describe ".restaurant_phone_no_format" do
    context "with valid restaurant phone no format" do
      it "restaurant containing phone no starts with 6,7,8,9 is valid" do
        expect(subject).to be_valid
      end
    end
    context "with invalid restaurant phone no format" do
      it "restaurant not containing phone no starts with 6,7,8,9 is invalid " do
        subject.phone_no =  "1234567890"
        expect(subject).not_to be_valid
      end
    end
  end

  describe ".restaurant_table_price_presence" do
    context "restaurant table price is present" do
      it "restaurant having table price is valid" do
        expect(subject).to be_valid
      end
    end
    context "restaurant table price is not present" do
      it "restaurant not having table_price is invalid" do
        subject.table_price = ""
        expect(subject).not_to be_valid
      end
    end
  end

  describe ".restaurant_table_price_minimum_value" do
    context "with valid restaurant table price" do
      it "restaurant having table price greater and equal to 1 is valid" do
        expect(subject).to be_valid
      end
    end
    context "with invalid restaurant table price" do
      it "restaurant not having table_price is invalid" do
        subject.table_price = -100.0
        expect(subject).not_to be_valid
      end
    end
  end

  #associations_test
  describe "has_many :food_items" do
    it { is_expected.to have_many :food_items }  
  end

  describe "has_many :book_tables" do
    it { is_expected.to have_many :book_tables }  
  end

  describe "has_many :reviews" do
    it { is_expected.to have_many :reviews }  
  end

  describe "belongs_to :category" do
    it { is_expected.to belong_to :category }  
  end

  #model_method
  describe "#rating" do
    it "should return average rating" do
      expect(review.rating).to eq(restaurant.rating)
    end
    it "should return zero rating" do
      restaurant.reviews.destroy_all
      expect(restaurant.rating).to eq(0)
    end
  end
end