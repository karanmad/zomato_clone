class User < ApplicationRecord
  has_secure_password

  VALID_EMAIL_REGEX = /\A[^@\s]+@([^@.\s]+\.)*[^@.\s]+\z/
  VALID_NAME_REGEX = /\A[\sA-Za-z]*\z/i

  before_save { self.email = email.downcase }

  has_many :carts, dependent: :destroy
  has_many :book_tables, dependent: :destroy
  has_many :reviews, dependent: :destroy
  
  validates :password, presence: true, length: { minimum: 6, maximum: 20 }
  validates :name, presence: true, format: { with:  VALID_NAME_REGEX }, length: { maximum: 35, minimum: 2}
  validates :email,presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }, length: { maximum: 80, minimum: 8 }
 
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

