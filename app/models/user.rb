class User < ApplicationRecord
  has_secure_password
  VALID_EMAIL_REGEX = 	/\A[^@\s]+@([^@.\s]+\.)*[^@.\s]+\z/
  VALID_NAME_REGEX = /\A[\sA-Za-z]*\z/i
  PASSWORD_FORMAT = /\A
  (?=.{6,})          
  (?=.*\d)           
  (?=.*[a-z])        
  /x

  before_save { self.email = email.downcase }
 
  has_many :carts, dependent: :destroy
  has_many :orders, through: :cart
  has_many :book_tables, dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates :password, presence: true, format: { with: PASSWORD_FORMAT , message: "must contain a lower case character,a digit with minimum 6 characters."}
  validates :name, presence: true, format: { with:  VALID_NAME_REGEX }, length: { maximum: 25, minimum: 2}
  validates :email,presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { :case_sensitive => false}
 
  def self.find_or_create_from_auth_hash(auth)
		where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
			user.provider = auth.provider
			user.uid = auth.uid
			user.name = auth.info.name
			user.email = auth.info.email
		  user.password = "zomato123"
			user.save!
		end
	end

end

